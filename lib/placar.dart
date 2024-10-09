import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Placar extends StatefulWidget {
  const Placar({super.key});

  @override
  State<Placar> createState() => _PlacarState();
}

class _PlacarState extends State<Placar> {
  static const double _shadowHeight = 4;
  double _position1 = 4;
  double _position2 = 4;

  int _score = 0;

  @override
  Widget build(BuildContext context) {
    final double _height = 150 - _shadowHeight;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 178, 178),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              // Stroke do texto
              alignment: Alignment.center,
              children: [
                Text(
                  "Parabéns!",
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
                  "Parabéns!",
                  style: TextStyle(
                    fontSize: 150,
                    fontFamily: 'Chubby Cheeks',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            ScoreDisplay(score: _score),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Primeiro botão com o ícone play.svg
                _buildButton(_position1, (position) {
                  _position1 = position;
                }, Colors.white, 'assets/play.svg'), // Usando play.svg
                const SizedBox(width: 100), // Espaço entre os botões
                // Segundo botão com o ícone menu.svg
                _buildButton(_position2, (position) {
                  _position2 = position;
                }, Colors.white, 'assets/menu.svg'), // Usando menu.svg
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(double position, Function(double) setPosition,
      Color color, String svgAsset) {
    // Tamanho do botão
    final double _height = 150 - _shadowHeight;

    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          setPosition(4);
        });
      },
      onTapDown: (_) {
        setState(() {
          setPosition(0);
        });
      },
      onTapCancel: () {
        setState(() {
          setPosition(4);
        });
      },
      child: Container(
        height: _height + _shadowHeight,
        width: _height + _shadowHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: _height,
                width: _height,
                decoration: BoxDecoration(
                  // Sombra do botão
                  color: Color.fromARGB(255, 171, 124, 23),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Animação do botão pressionado
            AnimatedPositioned(
              curve: Curves.easeIn,
              bottom: position,
              duration: const Duration(milliseconds: 70),
              child: Container(
                height: _height,
                width: _height,
                decoration: BoxDecoration(
                  // Cor do botao
                  color: const Color.fromARGB(255, 243, 177, 33),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  // Configurações da imagem .svg
                  child: SvgPicture.asset(
                    svgAsset,
                    fit: BoxFit.contain,
                    color: color,
                    width: _height - 60,
                    height: _height - 60,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para exibir a pontuação com stroke
class ScoreDisplay extends StatelessWidget {
  final int score;

  const ScoreDisplay({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          // Stroke
          '$score',
          style: TextStyle(
            fontSize: 140,
            fontFamily: 'Chubby Cheeks',
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 10
              ..color = Colors.black,
          ),
        ),
        Text(
          // Texto
          '$score',
          style: TextStyle(
            fontSize: 140,
            fontFamily: 'Chubby Cheeks',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
