import 'package:flutter/material.dart';
import 'package:semeador/JogoMetadinha.dart';
import 'package:semeador/MenuInicial.dart';
import 'package:semeador/MenuJogos.dart';
import 'package:semeador/MenuPerfil.dart';
import 'package:semeador/Placar.dart';
import 'package:semeador/JogoMemoria.dart';

enum FuncaoBotao{
  telaMenuInicial, telaPlacar, telaJogoMemoria, telaJogoMetadinha, telaMenuJogos, telaMenuPerfil
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
      case FuncaoBotao.telaJogoMetadinha:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => JogoMetadinha() ));
      case FuncaoBotao.telaMenuJogos:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuJogos() ));
      case FuncaoBotao.telaMenuPerfil:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuPerfil() ));
      default:
        return;
    }
  }
}