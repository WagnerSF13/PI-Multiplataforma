import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final String path;
  if (widget.svgPath == ""){
    path = "../assets/play.svg";
  }
  else{
    path = widget.svgPath;
  }

 final double _height = 64 - _shadowHeight;
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
         width: 200,
         child: Stack(
           children: [
             Positioned(
               bottom: 0,
               child: Container(
                 height: _height,
                 width: 200,
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
                 width: 200,
                 decoration: BoxDecoration(
                   color: widget.corBotao,
                   shape: BoxShape.circle,
                 ),
                 child: Center(
                   child: SvgPicture.asset(path)
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