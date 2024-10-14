import 'package:flutter/material.dart';
import 'package:semeador/utils/NomesPath.dart';

class JogoMemoria extends StatefulWidget{
  const JogoMemoria({super.key});

  @override
  State<StatefulWidget> createState() {
    return JogoMemoriaState();
  }
}

class JogoMemoriaState extends State<JogoMemoria>{
  final List<String> imagens = NomesPath.letras;
  final tamanhoJogo = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
          itemCount: imagens.length,
          itemBuilder: (BuildContext context, int index){
            return CartaJogo(pathImagem: imagens[index]);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: tamanhoJogo),
        )
      ),
    );
  }
}

class CartaJogo extends StatefulWidget{
  final String pathImagem;
  const CartaJogo({super.key, required this.pathImagem});

  @override
  State<StatefulWidget> createState() {
    return CartaJogoState();
  }
}

class CartaJogoState extends State<CartaJogo>{
  bool clicou = false;
  @override
  Widget build(BuildContext context) {
    String imagem = clicou == true ? widget.pathImagem : NomesPath.cartaAtras;
    return IconButton(
      onPressed: (){setState(() {
        clicou = !clicou;
      });},
      icon: Image.asset(imagem)
    );
  }
}