import "package:flutter/material.dart";
import "package:semeador/utils/CoresCustomizadas.dart";
import "package:semeador/utils/Navegacao.dart";
import "package:semeador/utils/NomesPath.dart";
import "package:semeador/utils/TextoCustomizado.dart";

class MenuJogos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextoCustomizado(texto: "Escolha um jogo", escalaTamanho: 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardClicavel("Metadinha", NomesPath.letraA, FuncaoBotao.telaJogoMetadinha, context),
                cardClicavel("Jogo da Memória", NomesPath.escondido, FuncaoBotao.telaJogoMemoria, context),
              ],
            )
            ],
        ),
      ),
    );
  }

  Widget cardClicavel(String texto, String pathImagem, FuncaoBotao funcaoBotao, BuildContext context){
    return InkWell(
      onTap: (){Navegacao.mudarTela(funcaoBotao, context); },
      child: Card(
        color: CoresCustomizadas.azul,
        child: Column(
          children: [
            Center(child: Image.asset(pathImagem)),
            Center(child: TextoCustomizado(texto: texto, escalaTamanho: 0.03))
          ],
        ),
      ),
    );
  }
}