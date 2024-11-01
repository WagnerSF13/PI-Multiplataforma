import 'package:flutter/material.dart';

class TextoCustomizado extends StatelessWidget{
  final String texto;
  final double tamanhoFonte;
  const TextoCustomizado({super.key, required this.texto, this.tamanhoFonte = 24.0});

  final String fontFamily = 'Chubby Cheeks';
  
  @override
  Widget build(BuildContext context) {
    return  Stack(
              // Stroke do texto
              alignment: Alignment.center,
              children: [
                Text(
                  texto,
                  style: TextStyle(
                    fontSize: tamanhoFonte,
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
                    fontSize: tamanhoFonte,
                    fontFamily: fontFamily,
                    color: Colors.white,
                  ),
                ),
              ],
    );
  }
}