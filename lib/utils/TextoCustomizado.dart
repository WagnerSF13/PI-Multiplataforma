import 'package:flutter/material.dart';

class TextoCustomizado extends StatelessWidget{
  final String texto;
  const TextoCustomizado({super.key, required this.texto});

  final String fontFamily = 'Chubby Cheeks';
  
  @override
  Widget build(BuildContext context) {
  final double largura = MediaQuery.of(context).size.width;
  final double altura = MediaQuery.of(context).size.height;

  final fontSize = (largura * 0.1 + altura * 0.1) / 2;
    return  Stack(
              // Stroke do texto
              alignment: Alignment.center,
              children: [
                Text(
                  texto,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: fontFamily,
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
                    fontSize: fontSize,
                    fontFamily: fontFamily,
                    color: Colors.white,
                  ),
                ),
              ],
    );
  }
}