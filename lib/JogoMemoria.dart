import 'package:flutter/material.dart';
import 'utils/NomesPath.dart';

class JogoMemoria extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return JogoMemoriaState();
  }
}

class JogoMemoriaState extends State<JogoMemoria>{
    final int tamanhoLinha = 4;
    final int tamanhoColuna = 3;

    late List<List<String>> listaCartas;
    late List<List<String>> listaImagens;


    List<List<String>> gerarCartas(){
      return List.generate(tamanhoLinha, (i) => List.filled(tamanhoColuna, NomesPath.escondido));
    }

    List<List<String>> gerarImagens(){
      List<String> alfabeto = NomesPath.letras;
      alfabeto.shuffle();
      int contador = 0;
      List<List<String>> listaImagens = List.generate(tamanhoLinha, (i) => List.filled(tamanhoColuna, ""));
      for (int linha = 0; linha < tamanhoLinha; linha++){
        for (int coluna = 0; coluna < tamanhoColuna; coluna++){
          listaImagens[linha][coluna] = alfabeto[contador++];
        }
      }
      return listaImagens;
    }
    @override
    void initState(){
      listaCartas = gerarCartas();
      listaImagens = gerarImagens();
    }
    

    void clicouCarta(int linha, int coluna){
      setState(() {
        if (listaCartas[linha][coluna] == listaImagens[linha][coluna]){
          listaCartas[linha][coluna] = NomesPath.escondido;
        }
        else{
          listaCartas[linha][coluna] = listaImagens[linha][coluna];
        }
      });
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: tamanhoColuna),
          itemCount: tamanhoLinha * tamanhoColuna,
          itemBuilder: (context, index){
            int linha = index ~/ tamanhoColuna;
            int coluna = index % tamanhoColuna;
            return GestureDetector(
              onTap: () => clicouCarta(linha, coluna),
              child: Card(
                child: Center(
                  child: listaCartas[linha][coluna] == NomesPath.escondido ?
                    Image.asset(listaImagens[linha][coluna], fit: BoxFit.cover) :
                    Image.asset(listaImagens[linha][coluna], fit: BoxFit.cover)
                  ),
                )
              );
          },
        ),
      ),
    );
  }
}