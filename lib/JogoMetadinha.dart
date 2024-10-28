import "package:flutter/material.dart";
import "package:semeador/utils/ImagemFundo.dart";
import "package:semeador/utils/Navegacao.dart";
import "package:semeador/utils/NomesPath.dart";

class JogoMetadinha extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return JogoMetadinhaState();
  }
}

class JogoMetadinhaState extends State<JogoMetadinha>{
  final int tamanhoJogo = 5;

  late final List<List<String>> imagensUsadas;
  late final List<String> imagensFixas;
  late final List<String> imagensMoveis;
  late final List<String> imagensCorretas;

  late final List<bool> podeMover = List.generate(tamanhoJogo, (valor) => true );

  List<String> gerarImagensFixas(List<List<String>> imagensUsadas){
    List<String> imagens = [];
    for (int i = 0; i < imagensUsadas.length; i++){
      imagens.add(imagensUsadas[i][1]);
    }
    return imagens;
  }
  List<String> gerarImagensMoveis(List<List<String>> imagensUsadas){
    List<String> imagens = [];
    for (int i = 0; i < imagensUsadas.length; i++){
      imagens.add(imagensUsadas[i][2]);
    }
    imagens.shuffle();
    return imagens;
  }
  List<String> gerarImagensCertas(List<List<String>> imagensUsadas){
    List<String> imagens = [];
    for (int i = 0; i < imagensUsadas.length; i++){
      imagens.add(imagensUsadas[i][3]);
    }
    return imagens;
  }

   @override
    void initState(){
      imagensUsadas = NomesPath.gerarImagens(tamanhoJogo);
      imagensMoveis = gerarImagensMoveis(imagensUsadas);
      imagensFixas = gerarImagensFixas(imagensUsadas);
      imagensCorretas = gerarImagensCertas(imagensUsadas);
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [ImagemFundo(imagem: NomesPath.fundoEscondido),
          Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
                List.generate(tamanhoJogo, (contador) => soltarAqui(contador) ),
            ),
            Spacer(), // Separa para ficar uma linha no topo e outra no fim da tela
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
                 List.generate(tamanhoJogo, (contador) => imagemMovivel(contador) ),
            )
          ],
        )],
        )
        ),
      );
  }

  // Imagem em baixo que podem ser movidas
  Widget imagemMovivel(int posLista){
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: podeMover[posLista] == false ? null : Draggable<String>( // Caso ja genha sido encaixada, nao mostrar nada
            data: imagensMoveis[posLista],
            feedback: Image.asset(imagensMoveis[posLista]),
            childWhenDragging: Image.asset(imagensMoveis[posLista]),
            child: Image.asset(imagensMoveis[posLista]), 
          ),
      ); 
  }

  // Imagens em cima que nao podem ser movidas
  Widget imagemFixa(int posLista){
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.asset(imagensFixas[posLista]),
      );
  }

  // Cria o widget que permite mover a imagem para outro lugar
  Widget soltarAqui(int posLista){
    return DragTarget<String>(
        onAcceptWithDetails: (detalhes) {
          // Verifica se acertou
          if(detalhes.data == imagensUsadas[posLista][2]){ // [2] pois eh a imagem de baixo
            setState(() {
              // Remover imagem movivel que foi corretamente colocada
              for (int i = 0; i < imagensMoveis.length; i++){ // i indica o indice das imagens moviveis
                if (imagensMoveis[i] == imagensUsadas[posLista][2]){
                  podeMover[i] = false; // Sinaliza para nao mostrar a parte de baixo da imagem ja completada
                  break;
                }
              }
              imagensFixas[posLista] = imagensCorretas[posLista]; // Muda para a image correta 
            });
            if (ganhou()){ 
              Navegacao.mudarTela(FuncaoBotao.telaPlacar, context);
            }
          } 
          else{ // Caso arrastou a imagem errada
            print("Errou");
          }
          },
        builder: (context, candidateData, rejectedData) { return imagemFixa(posLista); } );
  }

  bool ganhou(){
    return podeMover.every( (elemento) => !elemento );
  }
}
