import "package:flutter/material.dart";
import "package:semeador/utils/CardClicavel.dart";
import "package:semeador/utils/Navegacao.dart";
import "package:semeador/utils/NomesPath.dart";
import "package:semeador/utils/TextoCustomizado.dart";

class MenuJogos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TextoCustomizado(texto: "Escolha um jogo", escalaTamanho: 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardClicavel(imagemPath: NomesPath.abelha, operacaoBotao: FuncaoBotao.telaJogoMetadinha, texto: "Metadinha"),
                CardClicavel(imagemPath: NomesPath.escondido, operacaoBotao: FuncaoBotao.telaJogoMemoria, texto: "Memória"),
                CardClicavel(imagemPath: NomesPath.cachorro, operacaoBotao: FuncaoBotao.telaJogoQuebraCabeca, texto: "Cabeca")
              ],
            )
            ],
        ),
      ),
    );
  }

  
}