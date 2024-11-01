import 'package:flutter/material.dart';
import 'package:semeador/utils/CardResponsivo.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/NomesPath.dart';
import 'package:semeador/utils/TextoCustomizado.dart';

class MenuPerfil extends StatelessWidget{
  const MenuPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: TextoCustomizado(texto: "Escolha o Perfil", tamanhoFonte: 48.0),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index){
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    // TODO passar o nome do aluno e icone como parametro para criar o perfil de cada aluno cadastrado no bd junto com seu icone
                    child: CardResponsivo(imagemPath: NomesPath.abelha, operacaoBotao: FuncaoBotao.telaMenuJogos, texto: "Nome do aluno") // Container com o perfil de cada aluno e professor
                  );
                },
                childCount: 8, // Numero de contas no banco de dados
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3) // Quantidade de perfil por linha
            )
          ],
        ),
      ),
    );
  }
}