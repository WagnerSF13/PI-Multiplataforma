import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/NomesPath.dart';
import 'package:semeador/utils/Responsividade.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'dart:io';

class TelaCadastro extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TelaCadastroState();
  }
}

class TelaCadastroState extends State<TelaCadastro>{

  File? imagem;
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final double tamanho = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: TextoCustomizado(texto: "Cadastro"))),
        body: Column(
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
            botaoPegarImagem(),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: botaoLogin(), 
            )
          ],
        )
      ),
    );
  }

  Widget usuarioForm(){
    return TextFormField(
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
  Widget botaoLogin(){
    return BotaoAnimado(svgPath: NomesPath.play, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaMenuInicial);
  }

  Widget botaoPegarImagem(){
    return ElevatedButton(
      onPressed: pegarImagem,
      child: Text("Escolher imagem")
    );
  }

  Future<void> pegarImagem() async{
    try{
      final imagemEscolhida = await imagePicker.pickImage(source: ImageSource.gallery);
      if(imagemEscolhida != null){
        setState(() {
          imagem = File(imagemEscolhida.path);
        });
      }
    }
    catch (e){
      imagem = null;
    }
  }
}

