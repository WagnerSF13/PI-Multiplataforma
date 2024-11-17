import 'package:flutter/material.dart';
import 'package:semeador/utils/Responsividade.dart';
import 'utils/BotaoAnimado.dart';
import 'utils/CoresCustomizadas.dart';
import 'utils/NomesPath.dart';
import 'utils/TextoCustomizado.dart';
import 'package:semeador/utils/Navegacao.dart';

class TelaCadastroFim extends StatelessWidget{
  const TelaCadastroFim({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: CoresCustomizadas.azul,
          title: Center(
            child: TextoCustomizado(texto: "Cadastro do aluno feito com sucesso!", tamanhoFonte: 48.0),
          ),
        ),
        backgroundColor: CoresCustomizadas.azul,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //BotaoAnimado(svgPath: NomesPath.play, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaMenuInicial, escalaTamanho: 0.15),
                BotaoAnimado(svgPath: NomesPath.menu, corBotao: CoresCustomizadas.amarelo, corSombra: CoresCustomizadas.amareloSombra, operacaoBotao: FuncaoBotao.telaCadastro, escalaTamanho: 0.15)
              ],
            ),
          ],
        ),
      ),
    );
  }
}