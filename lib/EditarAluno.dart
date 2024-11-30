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

class EditarAluno extends StatefulWidget {
  final String alunoId;
  final String? nomeInicial;
  final String? imagemBase64Inicial;

  const EditarAluno({
    Key? key,
    required this.alunoId,
    required this.nomeInicial,
    required this.imagemBase64Inicial,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TelaEditarAlunoState();
  }
}

class TelaEditarAlunoState extends State<EditarAluno> {
  bool alterado = false; // Indica se algo foi alterado
  Uint8List? imagem;
  final ImagePicker imagePicker = ImagePicker();
  String nome = "";

  @override
  void initState() {
    super.initState();
    nome = widget.nomeInicial ??
        ""; // Inicializa com o nome inicial, se disponível
    if (widget.imagemBase64Inicial != null &&
        widget.imagemBase64Inicial!.isNotEmpty) {
      imagem = base64Decode(
          widget.imagemBase64Inicial!); // Decodifica a imagem inicial
    } else {
      // Busca os dados do Firebase se não foram fornecidos
      FirebaseFirestore.instance
          .collection('alunos')
          .doc(widget.alunoId)
          .get()
          .then((snapshot) {
        if (snapshot.exists) {
          setState(() {
            nome = snapshot.data()?['nome'] ?? "Sem Nome";
            String? imagemBase64 = snapshot.data()?['imagemBase64'];
            if (imagemBase64 != null && imagemBase64.isNotEmpty) {
              imagem = base64Decode(imagemBase64);
            }
          });
        }
      }).catchError((error) {
        // Adicione lógica para lidar com erros, se necessário
        print("Erro ao buscar os dados do aluno: $error");
      });
    }
  }

  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;
    final double pad = Responsividade.ehCelular(context) ? 5 : 10;
    double alturaToolbar = Responsividade.ehCelular(context) ? 60 : 120;
    return Scaffold(
      backgroundColor: CoresCustomizadas.azul,
      appBar: AppBar(
        backgroundColor: CoresCustomizadas.transparente,
        toolbarHeight: alturaToolbar,
        leadingWidth: 120,
        title: TextoCustomizado(
          texto: "Editar",
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
              operacaoBotao: FuncaoBotao.telaPerfilEditar,
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: pad),
                    child: botaoPegarImagem(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: pad),
                    child: botaoEditar(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: pad),
                    child: botaoApagar(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: preview(
                    imagem,
                    nome.isNotEmpty
                        ? nome
                        : (widget.nomeInicial ?? "Sem Nome")),
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
          alterado = novoTexto != widget.nomeInicial || imagem != null;
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

  Widget botaoApagar() {
    return SizedBox(
      width: Responsividade.ehCelular(context)
            ? MediaQuery.of(context).size.width * 0.3 // Largura para celular
            : MediaQuery.of(context).size.width *
                0.2, // Largura para outras telas
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: Responsividade.ehCelular(context) ? 12.0 : 20.0,
        ),
        backgroundColor: CoresCustomizadas.vermelho,
      ),
      onPressed: () async {
        await FirebaseFirestore.instance
            .collection('alunos')
            .doc(widget.alunoId)
            .delete();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Aluno excluído com sucesso!', textAlign: TextAlign.center,),
        ));

        Navegacao.mudarTela(
            FuncaoBotao.telaPerfilEditar, context); // Retorna à tela anterior
      },
      child: TextoCustomizado(
        texto: "Excluir Aluno",
        tamanhoFonte: Responsividade.ehCelular(context) ? 18.0 : 24.0,
      ),
    ));
  }

  Widget botaoEditar() {
    return SizedBox(
        width: Responsividade.ehCelular(context)
            ? MediaQuery.of(context).size.width * 0.3 // Largura para celular
            : MediaQuery.of(context).size.width *
                0.2, // Largura para outras telas
        child: ElevatedButton(
          style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return CoresCustomizadas.amarelo; // Cor para estado desabilitado
        }
        return CoresCustomizadas.amarelo; // Cor padrão
      },
    ),
    padding: WidgetStateProperty.all(
      EdgeInsets.symmetric(
        vertical: Responsividade.ehCelular(context) ? 12.0 : 20.0,
      ),
    ),
  ),
          onPressed: alterado
              ? () async {
                  if (imagem != null && nome.isNotEmpty) {
                    await FirebaseFirestore.instance
                        .collection('alunos')
                        .doc(widget.alunoId)
                        .update({
                      'nome': nome,
                      'imagemBase64': base64Encode(imagem!),
                    });

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Aluno editado com sucesso!', textAlign: TextAlign.center,),
                    ));
                    Navegacao.mudarTela(FuncaoBotao.telaPerfilEditar,
                        context); // Retorna à tela anterior
                  }
                }
              : null,
          child: TextoCustomizado(
            texto: "Confirmar",
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
              vertical: Responsividade.ehCelular(context) ? 12.0 : 20.0,
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
                ? Image.asset(NomesPath.escondido) // Placeholder
                : Image.memory(imagem), // Exibe a imagem do aluno
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              child: TextoCustomizado(
                  texto: texto.isNotEmpty
                      ? texto
                      : "Sem Nome"), // Exibe o nome ou um padrão
            ),
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
          // Marca como alterado apenas se a nova imagem for diferente da atual
          alterado = base64Encode(bytes) != widget.imagemBase64Inicial;
        });
      }
    } catch (e) {
      imagem = null;
    }
  }
}
