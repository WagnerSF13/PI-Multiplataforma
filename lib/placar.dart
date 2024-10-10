import 'package:flutter/material.dart';
import 'utils/BotaoAnimado.dart';
import 'utils/CoresCustomizadas.dart';
import 'utils/NomesPath.dart';
import 'utils/TextoCustomizado.dart';

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
            SizedBox(height: MediaQuery.of(context).size.width * 0.04),
            TextoCustomizado(texto: "Parabéns!", escalaTamanho: 0.15),
            TextoCustomizado(texto: "$pontos", escalaTamanho: 0.15),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotaoAnimado(svgPath: NomesPath.play, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaMenuInicial, escalaTamanho: 0.15),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  BotaoAnimado(svgPath: NomesPath.menu, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaMenuInicial, escalaTamanho: 0.15)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}