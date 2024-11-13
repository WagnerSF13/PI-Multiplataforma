import 'package:flutter/material.dart';
import 'dart:math';
import 'utils/NomesPath.dart'; 
import 'utils/Navegacao.dart';
import 'package:semeador/utils/TextoCustomizado.dart';

class JogoAdvinha extends StatefulWidget {
  @override
  _JogoAdvinhaState createState() => _JogoAdvinhaState();
}

class _JogoAdvinhaState extends State<JogoAdvinha> {
  late List<String> opcoes;
  late String imagemPergunta;
  late List<String> opcoesSelecionadas = [];

  @override
  void initState() {
    super.initState();
    _gerarPergunta();
  }

  void _gerarPergunta() {
    // Seleciona um grupo de imagens aleatório como pergunta
    List<String> grupoSelecionado =
        NomesPath.todasImagens[Random().nextInt(NomesPath.todasImagens.length)];
    
    // Define a imagem correta como a primeira do grupo
    imagemPergunta = grupoSelecionado.first;

    // Gera as opções (incluso a correta e outras erradas)
    Set<String> opcoesSet = {imagemPergunta};
    while (opcoesSet.length < 4) {
      List<String> grupoAleatorio =
          NomesPath.todasImagens[Random().nextInt(NomesPath.todasImagens.length)];
      opcoesSet.add(grupoAleatorio.first);
    }

    // Converte para lista e embaralha
    opcoes = opcoesSet.toList();
    opcoes.shuffle();
  }

  void _selecionarOpcao(String opcao) {
    if(!opcoesSelecionadas.contains(opcao)){ //verifica se a opção ja foi selecionada

    setState(() {
      opcoesSelecionadas.add(opcao); // adiciona a opção às opções selecionadas

      if (opcao == imagemPergunta) {
        // Acertou: Navegar para a tela de pontuação após um tempo
        Future.delayed(Duration(seconds: 1), () {
          Navegacao.mudarTela(FuncaoBotao.telaPlacar, context);
        });
      }
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: Center(child: TextoCustomizado(texto:"Advinha", tamanhoFonte: 48.0))),    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              child: Image.asset(imagemPergunta, height: 200),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              alignment: WrapAlignment.center,
              children: opcoes.map((opcao) {
              return GestureDetector(
                onTap: () {
                    _selecionarOpcao(opcao);     //seleciona opção     
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(12),
                  color: opcoesSelecionadas.contains(opcao)
                      ? (opcao == imagemPergunta ? Colors.green : Colors.red)
                      : Colors.grey[200],
                  child: Image.asset(opcao, height: 100),
                ),
              );
            }).toList(),   //converte as opções em uma lista de widgets
            )
          ],
        ),
      )
    );
  }
}
