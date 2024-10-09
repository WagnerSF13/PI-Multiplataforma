import "package:flutter/material.dart";

class MenuInicial extends StatelessWidget{
  const MenuInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Expanded(child: ImagemFundo()),
            BotaoJogar(),
          ],
        ),
      )
    );
  }
}

class BotaoJogar extends StatelessWidget{
  const BotaoJogar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(
            color: Colors.amber.shade800,
            offset: const Offset(1, 5),
            spreadRadius: 1,
          )],
        ),
        child: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(Colors.amber),
            iconSize: WidgetStatePropertyAll(100.0),
            shape: WidgetStatePropertyAll(CircleBorder())
          ),
          onPressed: (){},
          child: const Icon(Icons.play_arrow),
        ),
      )
    );
  }
}

class ImagemFundo extends StatelessWidget{
  const ImagemFundo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("../../images/FundoMenuInicial.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}