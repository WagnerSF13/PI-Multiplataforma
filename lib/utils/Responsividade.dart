import 'package:flutter/material.dart';

class Responsividade {
  static bool ehCelular(BuildContext context){
    return MediaQuery.of(context).size.width <= 1000;
  }
  static bool ehTablet(BuildContext context){
    final double tamanho = MediaQuery.of(context).size.width;
    return tamanho > 1000 && tamanho <= 1366;
  }
  static bool ehWeb(BuildContext context){
    return MediaQuery.of(context).size.width > 1366;
  }
}