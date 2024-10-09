import 'package:flutter/material.dart';
import 'BotaoAnimado.dart';

class PlacarNovo extends StatelessWidget{
  final int pontos;
  const PlacarNovo({super.key, required this.pontos});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 178, 178),
        body: Column(
          children: [
            TextoCustomizado(texto: "Parabéns!"),
            TextoCustomizado(texto: "$pontos"),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BotaoAnimado(svgPath: "", corBotao: Color.fromARGB(255, 243, 177, 33), corSombra: Color.fromARGB(255, 171, 124, 23)),
                  BotaoAnimado(svgPath: "", corBotao: Color.fromARGB(255, 243, 177, 33), corSombra: Color.fromARGB(255, 171, 124, 23))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextoCustomizado extends StatelessWidget{
  final String texto;
  const TextoCustomizado({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return  Stack(
              // Stroke do texto
              alignment: Alignment.center,
              children: [
                Text(
                  texto,
                  style: TextStyle(
                    fontSize: 150,
                    fontFamily: 'Chubby Cheeks',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 10
                      ..color = Colors.black,
                  ),
                ),
                Text(
                  // Texto
                  texto,
                  style: TextStyle(
                    fontSize: 150,
                    fontFamily: 'Chubby Cheeks',
                    color: Colors.white,
                  ),
                ),
              ],
    );
  }
}