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
    final double tamanho = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CoresCustomizadas.azul,
      appBar: AppBar(
        backgroundColor: CoresCustomizadas.azul,
        toolbarHeight: 90,
        title: TextoCustomizado(texto: "Cadastro", tamanhoFonte: 48.0),
        centerTitle: true,
        actions: [
          Align(
            alignment: Alignment.centerRight, // botão à direita
            child: Padding(
              padding: EdgeInsets.only(
                right: 16.0,
              ),
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
      body: Stack(
        children: [
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: Responsividade.ehWeb(context)
                            ? tamanho * 0.3
                            : tamanho * 0.6,
                        child: usuarioForm(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: botaoPegarImagem(),
                    ),
                    //preview(imagem, nome == "" ? "Nome" : nome),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: botaoCadastrar(),
                    ),
                  ],
                ),
                preview(imagem, nome == "" ? "Nome" : nome),
                ],
              ),
            ),
        ],
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

 Widget botaoCadastrar() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      backgroundColor: CoresCustomizadas.amarelo,
    ),
    onPressed: () {
      if (imagem != null && nome.isNotEmpty) {
        salvarDadosComImagem(nome, imagem!);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Por favor, insira um nome e escolha uma imagem.')),
        );
      }
    },
    child: TextoCustomizado(
      texto: "Cadastrar usuário",
      tamanhoFonte: 24.0,
    ),
  );
}


  Widget botaoPegarImagem() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        backgroundColor: CoresCustomizadas.amarelo,
      ),
      onPressed: pegarImagem,
      child: TextoCustomizado(
        texto: " Escolher imagem ",
        tamanhoFonte: 24.0,
      ),
    );
  }

  Widget preview(Uint8List? imagem, String texto) {
    return Container(
      color: Colors.blue,
      width: Responsividade.ehWeb(context) ? 300 : 200,
      height: Responsividade.ehWeb(context) ? 300 : 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 3,
              child: imagem == null
                  ? Image.asset(NomesPath.escondido)
                  : Image.memory(imagem)),
          Expanded(
              flex: 1, child: FittedBox(child: TextoCustomizado(texto: texto))),
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

Widget exibirImagem(String imagemBase64) {
  Uint8List imagemBytes = base64Decode(imagemBase64);
  return Image.memory(imagemBytes);
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
