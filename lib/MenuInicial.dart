import "package:flutter/material.dart";
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'package:semeador/utils/ImagemFundo.dart';
import 'utils/NomesPath.dart';

class MenuInicial extends StatelessWidget{
  const MenuInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            ImagemFundo(imagem: NomesPath.menuInicial),
            Positioned(
              top: 30.0,
              left: 20.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotaoAnimado(svgPath: NomesPath.usuario, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaLogin, escalaTamanho: 0.075),
              ],
            ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotaoAnimado(svgPath: NomesPath.play, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaMenuPerfil, escalaTamanho: 0.2),
                  TextoCustomizado(texto: "JOGAR", tamanhoFonte: 72.0)
              ],
            ),
            )
          ],
        ),
      )
    );
  }
}


