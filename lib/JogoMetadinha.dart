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
            Spacer(),
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

  Widget imagemMovivel(int posLista){
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: podeMover[posLista] == false ? null : Draggable<String>(
            data: imagensMoveis[posLista],
            feedback: Image.asset(imagensMoveis[posLista]),
            childWhenDragging: Image.asset(imagensMoveis[posLista]),
            child: Image.asset(imagensMoveis[posLista]), 
          ),
      ); 
  }

  Widget imagemFixa(int posLista){
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.asset(imagensFixas[posLista]),
      );
  }

  Widget soltarAqui(int posLista){
    return DragTarget<String>(
        onAcceptWithDetails: (detalhes) {
          if(detalhes.data == imagensUsadas[posLista][2]){
            setState(() {
              for (int i = 0; i < imagensMoveis.length; i++){
                if (imagensMoveis[i] == imagensUsadas[posLista][2]){
                  podeMover[i] = false;
                  break;
                }
              }
              imagensFixas[posLista] = imagensCorretas[posLista];
            });
            if (ganhou()){
              Navegacao.mudarTela(FuncaoBotao.telaPlacar, context);
            }
          } 
          else{
            print("Errou");
          }
          },
        builder: (context, candidateData, rejectedData) { return imagemFixa(posLista); } );
  }

  bool ganhou(){
    return podeMover.every( (elemento) => !elemento );
  }
}
