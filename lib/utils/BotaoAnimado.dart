import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'NomesPath.dart';

class BotaoAnimado extends StatefulWidget{
  final String svgPath;
  final Color corSombra;
  final Color corBotao;
  const BotaoAnimado({super.key, required this.svgPath, required this.corBotao, required this.corSombra});

  @override
  State<StatefulWidget> createState() {
    return BotaoAnimadoState();
  }
}

class BotaoAnimadoState extends State<BotaoAnimado>{
static const double _shadowHeight = 4;
double _position = 4;

@override
Widget build(BuildContext context) {
  final double largura = MediaQuery.of(context).size.width;
  final double altura = MediaQuery.of(context).size.height;

  final String path;
  final tamanho = (largura * 0.1 + altura * 0.1) / 2;
  final tamanhoIcones = (largura * 0.04 + altura * 0.04) / 2;
  if (widget.svgPath == ""){
    path = NomesPath.play;
  }
  else{
    path = widget.svgPath;
  }

 final double _height = tamanho - _shadowHeight;
 return Center(
     child: GestureDetector(
       onTapUp: (_) {
         setState(() {
           _position = 4;
         });
       },
       onTapDown: (_) {
         setState(() {
           _position = 0;
         });
       },
       onTapCancel: () {
         setState(() {
           _position = 4;
         });
       },
       child: Container(
         height: _height + _shadowHeight,
         width: tamanho,
         child: Stack(
           children: [
             Positioned(
               bottom: 0,
               child: Container(
                 height: _height,
                 width: tamanho,
                 decoration: BoxDecoration(
                   color: widget.corSombra,
                   shape: BoxShape.circle,
                 ),
               ),
             ),
             AnimatedPositioned(
               curve: Curves.easeIn,
               bottom: _position,
               duration: Duration(milliseconds: 70),
               child: Container(
                 height: _height,
                 width: tamanho,
                 decoration: BoxDecoration(
                   color: widget.corBotao,
                   shape: BoxShape.circle,
                 ),
                 child: Center(
                   child: SvgPicture.asset(path, width: tamanhoIcones, height: tamanhoIcones)
                 ),
               ),
             ),
           ],
         ),
       ),
     ),
   );
}
}