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

class TelaCadastro extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TelaCadastroState();
  }
}

class TelaCadastroState extends State<TelaCadastro>{

  Uint8List? imagem;
  final ImagePicker imagePicker = ImagePicker();
  String nome = "";

  @override
  Widget build(BuildContext context) {
    final double tamanho = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: TextoCustomizado(texto: "Cadastro"))),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: Responsividade.ehWeb(context) ? tamanho * 0.4 : tamanho * 0.6,
                    child: usuarioForm(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: Responsividade.ehWeb(context) ? tamanho * 0.4 : tamanho * 0.6,
                    child: senhaForm(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: botaoPegarImagem()),
                preview(imagem, nome == "" ? "Nome" : nome),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: botaoCadastrar(), 
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget usuarioForm(){
    return TextFormField(
      onChanged: (String novoTexto){
        setState(() {
          nome = novoTexto;
        });
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Usuario",
        labelText: "Usuário",
      ),
    );
  }
  Widget senhaForm(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Senha",
        labelText: "Senha",
      ),
    );
  }
  Widget botaoCadastrar(){
    return ElevatedButton(
      onPressed: (){},
      child: Text("Cadastrar usuário")
    );
  }

  Widget botaoPegarImagem(){
    return ElevatedButton(
      onPressed: pegarImagem,
      child: Text("Escolher imagem")
    );
  }

  Widget preview(Uint8List? imagem, String texto){
    return Container(
      color: Colors.blue,
      width: Responsividade.ehWeb(context) ? 300 : 200,
      height: Responsividade.ehWeb(context) ? 300 : 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 3, child: imagem == null ? Image.asset(NomesPath.escondido) : Image.memory(imagem)),
          Expanded(flex: 1, child: FittedBox(child: TextoCustomizado(texto: texto))),
        ],
      ),
    );
  }

  Future<void> pegarImagem() async{
    try{
      final imagemEscolhida = await imagePicker.pickImage(source: ImageSource.gallery);
      if(imagemEscolhida != null){
        final bytes = await imagemEscolhida.readAsBytes();
        setState(() {
          imagem = bytes;
        });
      }
    }
    catch (e){
      imagem = null;
    }
  }
}

