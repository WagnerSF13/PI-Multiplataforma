import 'package:flutter/material.dart';
import 'package:semeador/utils/ImagemFundo.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'utils/NomesPath.dart';

class JogoMemoria extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return JogoMemoriaState();
  }
}

class JogoMemoriaState extends State<JogoMemoria>{
    final int tamanhoLinha = 2;
    final int tamanhoColuna = 5;

    late List<List<String>> listaCartas;
    late List<List<String>> listaImagens;

    final List<int> ultimaCarta = [];
    bool errou = false;

    late List<List<bool>> cartasCertas = List.generate(tamanhoLinha, (i) => List.filled(tamanhoColuna, false) );

    List<List<String>> gerarCartas(){
      return List.generate(tamanhoLinha, (i) => List.filled(tamanhoColuna, NomesPath.escondido));
    }

    bool ganhou(){
      return cartasCertas.expand((linha) => linha).every((elemento) => elemento);
    }

    List<List<String>> gerarImagens(){
      List<String> alfabeto = List.from(NomesPath.letras);
      alfabeto.shuffle();
      while (alfabeto.length > ( (tamanhoColuna * tamanhoLinha) / 2) ) {
        alfabeto.removeLast();
      }
      final numeroLetras = alfabeto.length;
      //duplicar a litsa pois precisa de pares
      for (int i = 0; i < numeroLetras; i++){
        alfabeto.add(alfabeto[i]);
      }

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
        if (errou){
          listaCartas[ultimaCarta[0]][ultimaCarta[1]] = NomesPath.escondido;
          listaCartas[ultimaCarta[2]][ultimaCarta[3]] = NomesPath.escondido;
          errou = false;
          ultimaCarta.clear();  
        }
        if (cartasCertas[linha][coluna]){ // Se ja estiver certa, faz nada
          return;
        }
        if (ultimaCarta.isEmpty){ // seleciona a primeira carta
          ultimaCarta.add(linha);
          ultimaCarta.add(coluna);
          listaCartas[linha][coluna] = listaImagens[linha][coluna];
        }
        else{ // Seleciona a segunda carta
          listaCartas[linha][coluna] = listaImagens[linha][coluna];
            if (linha == ultimaCarta[0] && coluna == ultimaCarta[1]){ // se for a mesma carta que antes, desvira
              listaCartas[linha][coluna] = NomesPath.escondido;
              ultimaCarta.clear();  
            }
            else{ // se for outra carta
              if (listaImagens[linha][coluna] == listaImagens[ultimaCarta[0]][ultimaCarta[1]]){ // se for a mesma imagem
                cartasCertas[linha][coluna] = true;
                cartasCertas[ultimaCarta[0]][ultimaCarta[1]] = true;
                ultimaCarta.clear();  
                if (ganhou()){
                  Navegacao.mudarTela(FuncaoBotao.telaPlacar, context);
                }
              }
              else{ // errou
                listaCartas[linha][coluna] = listaImagens[linha][coluna];
                ultimaCarta.add(linha);
                ultimaCarta.add(coluna);
                errou = true;
              }
              
            }  
        }
      });
    }

    int cliques = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            ImagemFundo(imagem: NomesPath.fundoEscondido),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: tamanhoColuna),
              itemCount: tamanhoLinha * tamanhoColuna,
              itemBuilder: (context, index){
                int linha = index ~/ tamanhoColuna;
                int coluna = index % tamanhoColuna;
                return GestureDetector(
                  onTap: () => clicouCarta(linha, coluna),
                  child: Card(
                    color: veficiarErro(linha, coluna) ? Colors.red : verificaCerto(linha, coluna) ? Colors.green : Colors.white, 
                    child: Center(
                      child: listaCartas[linha][coluna] == NomesPath.escondido ?
                        Image.asset(NomesPath.escondido, fit: BoxFit.cover) :
                        Image.asset(listaImagens[linha][coluna], fit: BoxFit.cover)
                      ),
                    )
                  );
              },
            ),
          ],
        )
      ),
    );
  }

  bool veficiarErro(int linha, int coluna){
    if (ultimaCarta.length == 4){
      if ( (linha == ultimaCarta[0] && coluna == ultimaCarta[1]) || (linha == ultimaCarta[2] && coluna == ultimaCarta[3])){
        return true;
      }
    }
    return false;
  }

  bool verificaCerto(int linha, int coluna){
    return cartasCertas[linha][coluna];
  }
}
