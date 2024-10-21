import "package:flutter/material.dart";
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'utils/NomesPath.dart';

class MenuInicial extends StatelessWidget{
  const MenuInicial({super.key});

  @override
  Widget build(BuildContext context) {
    final tamanhoGap = MediaQuery.of(context).size.height * 0.2;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            ImagemFundo(),
            Center(
              child: Column(
                children: [
                  SizedBox(height: tamanhoGap),
                  BotaoAnimado(svgPath: NomesPath.play, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaJogoMetadinha, escalaTamanho: 0.2),
                  TextoCustomizado(texto: "JOGAR", escalaTamanho: 0.09)
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