import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/NomesPath.dart';
import 'package:semeador/utils/Responsividade.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class TelaCadastro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TelaCadastroState();
  }
}

class TelaCadastroState extends State<TelaCadastro> {
  Uint8List? imagem;
  final ImagePicker imagePicker = ImagePicker();
  String nome = "";

  @override
  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;
    final double pad = Responsividade.ehCelular(context) ? 3 : 10;
    double alturaToolbar = Responsividade.ehCelular(context) ? 60 : 120;
    return Scaffold(
      backgroundColor: CoresCustomizadas.azul,
      appBar: AppBar(
        backgroundColor: CoresCustomizadas.transparente,
        toolbarHeight: alturaToolbar,
        leadingWidth: 120,
        title: TextoCustomizado(
          texto: "Cadastro",
          tamanhoFonte: Responsividade.ehCelular(context) ? 36.0 : 48.0,
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0), // Espaçamento à esquerda
          child: SizedBox(
            width: 56.0, // Largura padrão para o espaço do leading
            height: 56.0, // Altura padrão para o espaço do leading
            child: BotaoAnimado(
              svgPath: NomesPath.voltar,
              corBotao: CoresCustomizadas.amarelo,
              corSombra: CoresCustomizadas.amareloSombra,
              operacaoBotao: FuncaoBotao.telaLogin,
              escalaTamanho: 0.075,
            ),
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: BotaoAnimado(
                svgPath: NomesPath.cancelar,
                corBotao: CoresCustomizadas.amarelo,
                corSombra: CoresCustomizadas.amareloSombra,
                operacaoBotao: FuncaoBotao.telaMenuInicial,
                escalaTamanho: 0.075,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: Responsividade.ehCelular(context) ? 2 : 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: Responsividade.ehCelular(context)
                          ? largura * 0.8
                          : largura * 0.5,
                      child: usuarioForm(),
                    ),
                  ),
                  SizedBox(
                    width: 600,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: pad),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: pad),
                                    child: botaoPegarImagem(),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: pad),
                                    child: botaoCadastrar(),
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: pad),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: pad),
                                    child: botaoCadastroProfessor(),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: pad),
                                    child: botaoEditarAluno(),
                                  ),
                                ],
                              )),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: preview(imagem, nome == "" ? "Nome" : nome),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget usuarioForm() {
    return TextFormField(
      onChanged: (String novoTexto) {
        setState(() {
          nome = novoTexto;
        });
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Usuário",
        labelStyle: TextStyle(color: CoresCustomizadas.azulEscuro),
        filled: true,
        fillColor: CoresCustomizadas.cinzaClaro,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira seu usuário';
        }
        return null;
      },
    );
  }

  Widget botaoCadastroProfessor() {
    return SizedBox(
        width: Responsividade.ehCelular(context)
            ? MediaQuery.of(context).size.width * 0.3 // Largura para celular
            : MediaQuery.of(context).size.width *
                0.2, // Largura para outras telas
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: Responsividade.ehCelular(context) ? 6.0 : 20.0,
            ),
            backgroundColor: CoresCustomizadas.azulEscuro,
          ),
          onPressed: () =>
              Navegacao.mudarTela(FuncaoBotao.telaCadastroProfessor, context),
          child: TextoCustomizado(
            texto: "Cadastrar Professor",
            tamanhoFonte: Responsividade.ehCelular(context) ? 18.0 : 24.0,
          ),
        ));
  }

  Widget botaoEditarAluno() {
    return SizedBox(
        width: Responsividade.ehCelular(context)
            ? MediaQuery.of(context).size.width * 0.3 // Largura para celular
            : MediaQuery.of(context).size.width *
                0.2, // Largura para outras telas
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: Responsividade.ehCelular(context) ? 6.0 : 20.0,
            ),
            backgroundColor: CoresCustomizadas.azulEscuro,
          ),
          onPressed: () =>
              Navegacao.mudarTela(FuncaoBotao.telaPerfilEditar, context),
          child: TextoCustomizado(
            texto: "Editar Aluno",
            tamanhoFonte: Responsividade.ehCelular(context) ? 18.0 : 24.0,
          ),
        ));
  }

  Widget botaoCadastrar() {
    return SizedBox(
        width: Responsividade.ehCelular(context)
            ? MediaQuery.of(context).size.width * 0.3 // Largura para celular
            : MediaQuery.of(context).size.width *
                0.2, // Largura para outras telas
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: Responsividade.ehCelular(context) ? 6.0 : 20.0,
            ),
            backgroundColor: CoresCustomizadas.amarelo,
          ),
          onPressed: () {
            if (imagem != null && nome.isNotEmpty) {
              salvarDadosComImagem(nome, imagem!);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Aluno cadastrado com sucesso!',
                  textAlign: TextAlign.center,
                ),
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Por favor, insira um nome e escolha uma imagem.',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          },
          child: TextoCustomizado(
            texto: "Cadastrar usuário",
            tamanhoFonte: Responsividade.ehCelular(context) ? 18.0 : 24.0,
          ),
        ));
  }

  Widget botaoPegarImagem() {
    return SizedBox(
        width: Responsividade.ehCelular(context)
            ? MediaQuery.of(context).size.width * 0.3 // Largura para celular
            : MediaQuery.of(context).size.width *
                0.2, // Largura para outras telas
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: Responsividade.ehCelular(context) ? 6.0 : 20.0,
            ),
            backgroundColor: CoresCustomizadas.amarelo,
          ),
          onPressed: pegarImagem,
          child: TextoCustomizado(
            texto: "Escolher imagem",
            tamanhoFonte: Responsividade.ehCelular(context) ? 18.0 : 24.0,
          ),
        ));
  }

  Widget preview(Uint8List? imagem, String texto) {
    return Container(
      color: Colors.blue,
      width: Responsividade.ehCelular(context) ? 150 : 300,
      height: Responsividade.ehCelular(context) ? 150 : 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: imagem == null
                ? Image.asset(NomesPath.escondido)
                : Image.memory(imagem),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(child: TextoCustomizado(texto: texto)),
          ),
        ],
      ),
    );
  }

  Future<void> salvarDadosComImagem(String nome, Uint8List imagemBytes) async {
    String imagemBase64 = base64Encode(imagemBytes);

    // Cria o documento com um ID gerado automaticamente
    final docRef = await FirebaseFirestore.instance.collection('alunos').add({
      'nome': nome, // Salva o nome do usuário
      'imagemBase64': imagemBase64, // Salva a imagem em Base64
    });

    // Atualiza o documento para incluir o ID gerado automaticamente
    await FirebaseFirestore.instance
        .collection('alunos')
        .doc(docRef.id)
        .update({
      'id': docRef.id, // Adiciona o ID gerado automaticamente como um campo
    });
  }

  Future<void> pegarImagem() async {
    try {
      final imagemEscolhida =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (imagemEscolhida != null) {
        final bytes = await imagemEscolhida.readAsBytes();
        setState(() {
          imagem = bytes;
        });
      }
    } catch (e) {
      imagem = null;
    }
  }
}
