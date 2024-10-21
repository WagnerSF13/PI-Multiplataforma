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
          children: [
            TextoCustomizado(texto: "Escolha um jogo", escalaTamanho: 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardClicavel("Metadinha", NomesPath.letraA, FuncaoBotao.telaJogoMetadinha, context),
                cardClicavel("Memória", NomesPath.escondido, FuncaoBotao.telaJogoMemoria, context),
              ],
            )
            ],
        ),
      ),
    );
  }

  Widget cardClicavel(String texto, String pathImagem, FuncaoBotao funcaoBotao, BuildContext context){
    final double largura = MediaQuery.of(context).size.width;
    final double altura = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){Navegacao.mudarTela(funcaoBotao, context); },
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
        width: largura * 0.2,
        height: altura * 0.5,
        child: Card(
        color: CoresCustomizadas.azul,
        child: Column(
          children: [
            Center(child: Image.asset(pathImagem, width: largura * 0.15, height: altura * 0.3, fit: BoxFit.contain,)),
            Center(child: TextoCustomizado(texto: texto, escalaTamanho: 0.06))
          ],
        ),
      ),
      ),
      )
    );
  }
}