import 'package:flutter/material.dart';
import "package:semeador/utils/Navegacao.dart";

class CardResponsivo extends StatelessWidget{
  final String imagemPath;
  final Color cor;
  final FuncaoBotao operacaoBotao;
  final String texto;
  const CardResponsivo({super.key, required this.imagemPath, this.cor = Colors.blue, required this.operacaoBotao, required this.texto});

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navegacao.mudarTela(operacaoBotao, context);
      }, 
      child: Container(
        color: cor,
        child: Column(
          children: [
            Expanded(flex: 3, child: Image.asset(imagemPath)),
            Expanded(flex: 1, child: FittedBox(child: Text(texto)))
          ],
        ),
      ),
    );
  }
}
