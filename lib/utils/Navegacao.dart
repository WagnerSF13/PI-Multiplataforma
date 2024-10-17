import 'package:flutter/material.dart';
import 'package:semeador/MenuInicial.dart';
import 'package:semeador/Placar.dart';
import 'package:semeador/JogoMemoria.dart';

enum FuncaoBotao{
  telaMenuInicial, telaPlacar, telaJogoMemoria
}

class Navegacao {
  
  static void mudarTela(FuncaoBotao operacaoBotao, context){
    switch(operacaoBotao){
      case FuncaoBotao.telaMenuInicial:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuInicial() ));
      case FuncaoBotao.telaPlacar:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Placar(pontos: 3) ));
      case FuncaoBotao.telaJogoMemoria:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => JogoMemoria() ));
      default:
        return;
    }
  }
}