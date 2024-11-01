import 'package:flutter/material.dart';
import 'utils/BotaoAnimado.dart';
import 'utils/CoresCustomizadas.dart';
import 'utils/NomesPath.dart';
import 'utils/TextoCustomizado.dart';
import 'package:semeador/utils/Navegacao.dart';

class Placar extends StatelessWidget{
  final int pontos;
  const Placar({super.key, required this.pontos});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CoresCustomizadas.azul,
        body: Column(
          children: [
            TextoCustomizado(texto: "Parabéns!", tamanhoFonte: 72.0),
            TextoCustomizado(texto: "$pontos", tamanhoFonte: 72.0,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //BotaoAnimado(svgPath: NomesPath.play, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaMenuInicial, escalaTamanho: 0.15),
                  //SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  BotaoAnimado(svgPath: NomesPath.menu, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaMenuJogos, escalaTamanho: 0.15)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}