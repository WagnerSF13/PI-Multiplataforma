import "package:flutter/material.dart";
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'utils/NomesPath.dart';

class MenuInicial extends StatelessWidget{
  const MenuInicial({super.key});

  @override
  Widget build(BuildContext context) {
    final tamanhoGap = MediaQuery.of(context).size.height * 0.3;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Expanded(child: ImagemFundo()),
            Center(
              child: Column(
                children: [
                  SizedBox(height: tamanhoGap),
                  BotaoAnimado(svgPath: NomesPath.play, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaPlacar),
                  TextoCustomizado(texto: "JOGAR")
              ],
            ),
            )
          ],
        ),
      )
    );
  }
}


class ImagemFundo extends StatelessWidget{
  const ImagemFundo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(NomesPath.menuInicial),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}