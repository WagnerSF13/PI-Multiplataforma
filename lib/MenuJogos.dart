import "package:flutter/material.dart";
import "package:semeador/utils/BotaoAnimado.dart";
import "package:semeador/utils/CardResponsivo.dart";
import "package:semeador/utils/CoresCustomizadas.dart";
import "package:semeador/utils/Navegacao.dart";
import "package:semeador/utils/NomesPath.dart";
import "package:semeador/utils/Responsividade.dart";
import "package:semeador/utils/TextoCustomizado.dart";

class MenuJogos extends StatelessWidget {

  final List<Widget> cartoesJogos = [];
  @override
  Widget build(BuildContext context) {
    cartoesJogos.add(CardResponsivo(imagemPath: NomesPath.metadinha, operacaoBotao: FuncaoBotao.telaJogoMetadinha, texto: "Metadinha"));
    cartoesJogos.add(CardResponsivo(imagemPath: NomesPath.memoria, operacaoBotao: FuncaoBotao.telaJogoMemoria, texto: "Memória"));
    cartoesJogos.add(CardResponsivo(imagemPath: NomesPath.cabeca, operacaoBotao: FuncaoBotao.telaJogoQuebraCabeca, texto: "Cabeça"));
    cartoesJogos.add(CardResponsivo(imagemPath: NomesPath.adivinha, operacaoBotao: FuncaoBotao.telaJogoAdvinha, texto: "Adivinha"));
    double alturaToolbar = Responsividade.ehCelular(context) ? 60 : 120;
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CoresCustomizadas.azul,
        appBar: AppBar(
          backgroundColor: CoresCustomizadas.azul,
          toolbarHeight: alturaToolbar,
          leadingWidth: 120,
          title:
              TextoCustomizado(texto: "Escolha um Jogo", tamanhoFonte: 48.0),
          centerTitle: true,
          leading: Padding(
          padding: EdgeInsets.only(left: 8.0), // Espaçamento à esquerda
          child: SizedBox(
            width: 56.0, // Largura padrão para o espaço do leading
            height: 56.0, // Altura padrão para o espaço do leading
            child: BotaoAnimado(
              svgPath: NomesPath.voltar,
              corBotao: CoresCustomizadas.amarelo,
              corSombra: CoresCustomizadas.amareloSombra,
              operacaoBotao: FuncaoBotao.telaMenuPerfil,
              escalaTamanho: 0.075,
            ),
          ),
        ),
          actions: [
            Align(
              alignment: Alignment.centerRight, // botão à direita
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16.0,
                ),
                child: BotaoAnimado(
                  svgPath: NomesPath.cancelar,
                  corBotao: CoresCustomizadas.amarelo,
                  corSombra: CoresCustomizadas.amareloSombra,
                  operacaoBotao: FuncaoBotao.telaMenuInicial,
                  escalaTamanho: 0.075,
                ),
              ),
            ),
          ],
        ),
        body: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: cartoesJogos[index],
                  );
                },
                itemCount: 4,
                shrinkWrap: true, 
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
