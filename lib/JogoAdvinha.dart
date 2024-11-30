import 'package:flutter/material.dart';
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'dart:math';
import 'utils/NomesPath.dart';
import 'utils/Navegacao.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'package:semeador/utils/Responsividade.dart';

class JogoAdvinha extends StatefulWidget {
  @override
  _JogoAdvinhaState createState() => _JogoAdvinhaState();
}

class _JogoAdvinhaState extends State<JogoAdvinha> {
  late List<String> opcoes;
  String imagemPergunta = "";
  late List<String> opcoesSelecionadas = [];
  int turnoAtual = 1;
  bool acertou = false;

  @override
  void initState() {
    super.initState();
    _gerarPergunta();
  }

  void _gerarPergunta() {
    String novaImagemPergunta;

    do {
      // Seleciona um grupo de imagens aleatório como pergunta
      List<String> grupoSelecionado = NomesPath
          .todasImagens[Random().nextInt(NomesPath.todasImagens.length)];
      // Define a imagem correta como a primeira do grupo
      novaImagemPergunta = grupoSelecionado.first;
    } while (novaImagemPergunta == imagemPergunta);

    imagemPergunta = novaImagemPergunta;

    // Gera as opções (incluso a correta e outras erradas)
    Set<String> opcoesSet = {imagemPergunta};
    while (opcoesSet.length < 4) {
      List<String> grupoAleatorio = NomesPath
          .todasImagens[Random().nextInt(NomesPath.todasImagens.length)];
      opcoesSet.add(grupoAleatorio.first);
    }

    // Converte para lista e embaralha
    opcoes = opcoesSet.toList();
    opcoes.shuffle();
  }

  void _selecionarOpcao(String opcao) {
    if (!opcoesSelecionadas.contains(opcao)) {
      setState(() {
        opcoesSelecionadas
            .add(opcao); // Adiciona a opção às opções selecionadas

        if (opcao == imagemPergunta) {
          acertou = true;
          // Marca a resposta correta com verde e aguarda antes de avançar para o próximo turno
          Future.delayed(Duration(seconds: 1), () {
            if (turnoAtual == 3) {
              // Terceiro turno: Navegar para a tela de pontuação
              Navegacao.mudarTela(FuncaoBotao.telaPlacar, context);
            } else {
              // Avança para o próximo turno
              acertou = false;
              turnoAtual++;
              opcoesSelecionadas.clear();
              _gerarPergunta();
              setState(() {}); // Atualiza a interface para refletir as mudanças
            }
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double alturaToolbar = Responsividade.ehCelular(context) ? 60 : 120;
    double tamanhoImagem = Responsividade.ehWeb(context)
        ? 400
        : Responsividade.ehCelular(context)
            ? 150
            : Responsividade.ehTablet(context)
                ? 200
                : 300;
    double tamanhoOpcao = Responsividade.ehWeb(context)
        ? 180
        : Responsividade.ehCelular(context)
            ? 80
            : Responsividade.ehTablet(context)
                ? 120
                : 150;
    return Scaffold(
        backgroundColor: CoresCustomizadas.azul,
        appBar: AppBar(
          toolbarHeight: alturaToolbar,
          backgroundColor: CoresCustomizadas.azul,
          actions: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: BotaoAnimado(
                  svgPath: NomesPath.cancelar,
                  corBotao: CoresCustomizadas.amarelo,
                  corSombra: CoresCustomizadas.amareloSombra,
                  operacaoBotao: FuncaoBotao.telaMenuJogos,
                  escalaTamanho: 0.075,
                ),
              ),
            ),
          ],
          title: TextoCustomizado(
            texto: "Jogo da Memória",
            tamanhoFonte: 48.0,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imagemPergunta.isNotEmpty)
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      acertou == true ? Colors.transparent : Colors.black,
                      acertou == true ? BlendMode.saturation : BlendMode.srcIn),
                  child: Image.asset(imagemPergunta, height: tamanhoImagem),
                ),
              SizedBox(height: 10),
              Wrap(
                spacing: Responsividade.ehWeb(context)
                    ? 32.0
                    : Responsividade.ehCelular(context)
                        ? 8.0
                        : Responsividade.ehTablet(context)
                            ? 16.0
                            : 24.0,
                runSpacing: Responsividade.ehWeb(context)
                    ? 32.0
                    : Responsividade.ehCelular(context)
                        ? 8.0
                        : Responsividade.ehTablet(context)
                            ? 16.0
                            : 24.0,
                alignment: WrapAlignment.center,
                children: opcoes.map((opcao) {
                  return GestureDetector(
                    onTap: () {
                      _selecionarOpcao(opcao); //seleciona opção
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(12),
                      color: opcoesSelecionadas.contains(opcao)
                          ? (opcao == imagemPergunta
                              ? Colors.green
                              : Colors.red)
                          : CoresCustomizadas.azulEscuro,
                      child: Image.asset(opcao, height: tamanhoOpcao),
                    ),
                  );
                }).toList(), //converte as opções em uma lista de widgets
              )
            ],
          ),
        ));
  }
}
