import 'dart:typed_data';
import 'package:flutter/material.dart';
import "package:semeador/utils/Navegacao.dart";
import 'package:semeador/utils/Responsividade.dart';
import 'package:semeador/utils/TextoCustomizado.dart';

class CardResponsivo extends StatelessWidget {
  final String? imagemPath; // Caminho para a imagem local
  final Uint8List? imagemBytes; // Imagem em formato Base64
  final Color cor;
  final FuncaoBotao operacaoBotao;
  final String texto;

  const CardResponsivo({
    super.key,
    this.imagemPath,
    this.imagemBytes,
    this.cor = Colors.blue,
    this.operacaoBotao = FuncaoBotao.nada,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        operacaoBotao != FuncaoBotao.nada
            ? Navegacao.mudarTela(operacaoBotao, context)
            : {};
      },
      child: Container(
        width: Responsividade.ehCelular(context)
            ? 200
            : Responsividade.ehTablet(context)
                ? 400
                : 500,
        height: Responsividade.ehCelular(context)
            ? 200
            : Responsividade.ehTablet(context)
                ? 400
                : 500,
        color: cor,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: imagemBytes != null
                  ? Image.memory(imagemBytes!)
                  : (imagemPath != null
                      ? Image.asset(imagemPath!)
                      : Icon(Icons.person, size: 100)),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(child: TextoCustomizado(texto: texto,)),
            ),
          ],
        ),
      ),
    );
  }
}