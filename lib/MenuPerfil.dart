import "package:flutter/material.dart";
import "package:semeador/utils/CardClicavel.dart";
import "package:semeador/utils/ImagemFundo.dart";
import "package:semeador/utils/Navegacao.dart";
import "package:semeador/utils/NomesPath.dart";
import "package:semeador/utils/TextoCustomizado.dart";

class MenuPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
            children: [
              ImagemFundo(imagem: NomesPath.menuInicial),
              ListaDePerfil()
            ],
          )
      ),
    );
  }
}

class ListaDePerfil extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          TextoCustomizado(texto: "Escolha o perfil", escalaTamanho: 0.075),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 5, // numero de alunos + professores no banco
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navegacao.mudarTela(FuncaoBotao.telaMenuJogos, context);
                  },
                  child: CardClicavel(imagemPath: NomesPath.escondido, operacaoBotao: FuncaoBotao.telaMenuJogos, texto: "Nome aluno") // Nome do aluno ou professor
                );
              },
            ),
          ),
        ],
      );
  }
}