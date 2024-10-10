import "package:flutter/material.dart";
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'utils/NomesPath.dart';

class MenuInicial extends StatelessWidget{
  const MenuInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Expanded(child: ImagemFundo()),
            BotaoAnimado(svgPath: NomesPath.play, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra),
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