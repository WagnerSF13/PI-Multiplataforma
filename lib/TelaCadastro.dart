import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/CardResponsivo.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/NomesPath.dart';
import 'package:semeador/utils/Responsividade.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    final double pad = Responsividade.ehCelular(context) ? 5 : 10;
    double alturaToolbar = Responsividade.ehCelular(context) ? 60 : 120;
    return Scaffold(
      backgroundColor: CoresCustomizadas.azul,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: alturaToolbar,
        title: TextoCustomizado(
          texto: "Cadastro",
          tamanhoFonte: Responsividade.ehCelular(context) ? 36.0 : 48.0,
        ),
        centerTitle: true,
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: pad),
                    child: botaoPegarImagem(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: pad),
                    child: botaoCadastrar(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: pad),
                    child: TextoCustomizado(
                      texto: "Ou...",
                      tamanhoFonte:
                          Responsividade.ehCelular(context) ? 18.0 : 24.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: pad),
                    child: botaoCadastroProfessor(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: pad),
                    child: botaoEditarAluno(),
                  ),
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: Responsividade.ehCelular(context) ? 12.0 : 20.0,
          horizontal: Responsividade.ehCelular(context) ? 8.0 : 16.0,
        ),
        backgroundColor: CoresCustomizadas.azulEscuro,
      ),
      onPressed: () => Navegacao.mudarTela(FuncaoBotao.telaCadastroProfessor, context),
      child: TextoCustomizado(
        texto: "Cadastrar Professor",
        tamanhoFonte: Responsividade.ehCelular(context) ? 18.0 : 24.0,
      ),
    );
  }

  Widget botaoEditarAluno() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: Responsividade.ehCelular(context) ? 12.0 : 20.0,
          horizontal: Responsividade.ehCelular(context) ? 8.0 : 16.0,
        ),
        backgroundColor: CoresCustomizadas.azulEscuro,
      ),
      onPressed: () => Navegacao.mudarTela(FuncaoBotao.telaLogin, context),
      child: TextoCustomizado(
        texto: "Editar Aluno",
        tamanhoFonte: Responsividade.ehCelular(context) ? 18.0 : 24.0,
      ),
    );
  }

  Widget botaoCadastrar() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: Responsividade.ehCelular(context) ? 12.0 : 20.0,
          horizontal: Responsividade.ehCelular(context) ? 8.0 : 16.0,
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
    );
  }

  Widget botaoPegarImagem() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: Responsividade.ehCelular(context) ? 12.0 : 20.0,
          horizontal: Responsividade.ehCelular(context) ? 8.0 : 16.0,
        ),
        backgroundColor: CoresCustomizadas.amarelo,
      ),
      onPressed: pegarImagem,
      child: TextoCustomizado(
        texto: "Escolher imagem",
        tamanhoFonte: Responsividade.ehCelular(context) ? 18.0 : 24.0,
      ),
    );
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
    await FirebaseFirestore.instance.collection('alunos').add({
      'nome': nome,
      'imagemBase64': imagemBase64,
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
