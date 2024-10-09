import 'package:code/PlacarNovo.dart';
import 'package:code/Teste.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'placar.dart';

void main() {
  runApp(PlacarNovo(pontos: 3));
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Placar()
    );
  }
}