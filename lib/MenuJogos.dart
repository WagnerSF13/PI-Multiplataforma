import "package:flutter/material.dart";
import "package:semeador/utils/CardResponsivo.dart";
import "package:semeador/utils/CoresCustomizadas.dart";
import "package:semeador/utils/Navegacao.dart";
import "package:semeador/utils/NomesPath.dart";
import "package:semeador/utils/TextoCustomizado.dart";

class MenuJogos extends StatelessWidget {

  final List<Widget> cartoesJogos = [];
  @override
  Widget build(BuildContext context) {
    cartoesJogos.add(CardResponsivo(imagemPath: NomesPath.abelha, operacaoBotao: FuncaoBotao.telaJogoMetadinha, texto: "Metadinha"));
    cartoesJogos.add(CardResponsivo(imagemPath: NomesPath.escondido, operacaoBotao: FuncaoBotao.telaJogoMemoria, texto: "Memória"));
    cartoesJogos.add(CardResponsivo(imagemPath: NomesPath.cachorro, operacaoBotao: FuncaoBotao.telaJogoQuebraCabeca, texto: "Cabeça"));
    cartoesJogos.add(CardResponsivo(imagemPath: NomesPath.tigre, operacaoBotao: FuncaoBotao.telaJogoAdvinha, texto: "Adivinha"));
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: TextoCustomizado(texto: "Escolha um jogo", tamanhoFonte: 48.0),
          ),
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
