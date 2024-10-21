import "package:flutter/material.dart";
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

  late final List<String> imagensFixas;
  late final List<String> imagensMoveis;

  List<String> gerarImanges(){
    List<String> alfabeto = List.from(NomesPath.letras);
    alfabeto.shuffle();

    while(alfabeto.length > tamanhoJogo){
      alfabeto.removeLast();
    }
    return alfabeto;
  }

  late final List<String> imagensCorretas;

  late final List<bool> podeMover = List.generate(tamanhoJogo, (valor) => true );

   @override
    void initState(){
      imagensFixas = gerarImanges();
      imagensMoveis = List.from(imagensFixas);
      imagensMoveis.shuffle();
      imagensCorretas = NomesPath.gerarLetrasCorretas(imagensFixas);
    }

  @override
  Widget build(BuildContext context) {
    int contadorMovel = 0;
    int contadorFixo = 0;
    return MaterialApp(
      home: Scaffold(
        body: Column(
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
          if(detalhes.data == imagensFixas[posLista]){
            setState(() {
              for (int i = 0; i < imagensMoveis.length; i++){
                if (imagensMoveis[i] == imagensFixas[posLista]){
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
