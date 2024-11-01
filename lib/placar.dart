import 'package:flutter/material.dart';
import 'package:semeador/utils/Responsividade.dart';
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
        appBar: AppBar(
          backgroundColor: CoresCustomizadas.azul,
          title: Center(
            child: TextoCustomizado(texto: "Parabéns!", tamanhoFonte: 48.0),
          ),
        ),
        backgroundColor: CoresCustomizadas.azul,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextoCustomizado(texto: "$pontos", tamanhoFonte: Responsividade.ehWeb(context) ? 256.0 : Responsividade.ehTablet(context) ? 150.0 : 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //BotaoAnimado(svgPath: NomesPath.play, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaMenuInicial, escalaTamanho: 0.15),
                BotaoAnimado(svgPath: NomesPath.menu, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaMenuJogos, escalaTamanho: 0.15)
              ],
            ),
          ],
        ),
      ),
    );
  }
}