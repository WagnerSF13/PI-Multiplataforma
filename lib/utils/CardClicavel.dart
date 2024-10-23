import 'package:flutter/material.dart';
import "package:semeador/utils/Navegacao.dart";
import "package:semeador/utils/TextoCustomizado.dart";


class CardClicavel extends StatelessWidget{
  final String imagemPath;
  final Color corCard;
  final FuncaoBotao operacaoBotao;
  final double escalaTamanho;
  final String texto;
  const CardClicavel({super.key, required this.imagemPath, this.corCard = Colors.blue, required this.operacaoBotao, this.escalaTamanho = 0.1, this.texto = ""});


  @override
  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;
    final double altura = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){Navegacao.mudarTela(operacaoBotao, context); },
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
        width: largura * 0.2,
        height: altura * 0.5,
        child: Card(
        color: corCard,
        child: Column(
          children: [
            Center(child: Image.asset(imagemPath, width: largura * 0.15, height: altura * 0.3, fit: BoxFit.contain,)),
            Center(child: TextoCustomizado(texto: texto, escalaTamanho: 0.06))
          ],
        ),
      ),
      ),
      )
    );
  }


}