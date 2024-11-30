import 'package:flutter/material.dart';
import 'package:semeador/JogoMetadinha.dart';
import 'package:semeador/MenuInicial.dart';
import 'package:semeador/MenuJogos.dart';
import 'package:semeador/MenuPerfil.dart';
import 'package:semeador/MenuPerfilEditar.dart';
import 'package:semeador/Placar.dart';
import 'package:semeador/JogoMemoria.dart';
import 'package:semeador/QuebraCabeca.dart';
import 'package:semeador/JogoAdvinha.dart';
import 'package:semeador/TelaCadastro.dart';
import 'package:semeador/TelaCadastroProfessor.dart';
import 'package:semeador/TelaLogin.dart';
import 'package:semeador/EditarAluno.dart';

enum FuncaoBotao{
  telaMenuInicial, telaPlacar, telaJogoMemoria, telaJogoMetadinha, telaMenuJogos, telaMenuPerfil, telaJogoQuebraCabeca, telaJogoAdvinha, telaLogin, telaCadastro, telaCadastroFim, telaCadastroProfessor, telaEditarAluno, telaPerfilEditar, nada
}

class Navegacao {
  
  static void mudarTela(FuncaoBotao operacaoBotao, BuildContext context, {
  String? alunoId,
  String? nomeInicial,
  String? imagemBase64Inicial,
}){
    switch(operacaoBotao){
      case FuncaoBotao.telaMenuInicial:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuInicial() ));
      case FuncaoBotao.telaPlacar:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Placar(pontos: 10) ));
      case FuncaoBotao.telaJogoMemoria:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => JogoMemoria() ));
      case FuncaoBotao.telaJogoMetadinha:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => JogoMetadinha() ));
      case FuncaoBotao.telaMenuJogos:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuJogos() ));
      case FuncaoBotao.telaMenuPerfil:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuPerfil() ));
      case FuncaoBotao.telaJogoQuebraCabeca:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuebraCabeca() ));
      case FuncaoBotao.telaJogoAdvinha:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => JogoAdvinha() ));
      case FuncaoBotao.telaLogin:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TelaLogin() ));
      case FuncaoBotao.telaCadastro:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TelaCadastro() ));
      case FuncaoBotao.telaCadastroProfessor:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TelaCadastroProfessor() ));
      case FuncaoBotao.telaEditarAluno:
      if (alunoId == null) {
        throw ArgumentError(
          'Parâmetros obrigatórios ausentes ao navegar para telaEditarAluno',
        );
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EditarAluno(
            alunoId: alunoId,
            nomeInicial: nomeInicial,
            imagemBase64Inicial: imagemBase64Inicial,
          ),
        ),
      );
      break;
      case FuncaoBotao.telaPerfilEditar:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuPerfilEditar() ));

      default:
        return;
    }
  }
}