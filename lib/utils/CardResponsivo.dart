import 'package:flutter/material.dart';
import "package:semeador/utils/Navegacao.dart";
import 'package:semeador/utils/Responsividade.dart';

class CardResponsivo extends StatelessWidget{
  final String imagemPath;
  final Color cor;
  final FuncaoBotao operacaoBotao;
  final String texto;
  const CardResponsivo({super.key, required this.imagemPath, this.cor = Colors.blue, this.operacaoBotao = FuncaoBotao.nada, required this.texto});

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        operacaoBotao != FuncaoBotao.nada ? Navegacao.mudarTela(operacaoBotao, context) : {};
      }, 
      child: Container(
        width: Responsividade.ehCelular(context) ? 200 : Responsividade.ehTablet(context) ? 400 : 500,
        height: Responsividade.ehCelular(context) ? 200 : Responsividade.ehTablet(context) ? 400 : 500,
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
