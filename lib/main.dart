import 'package:flutter/material.dart';
import 'package:semeador/MenuInicial.dart';
import 'package:flutter/services.dart';
import 'package:semeador/TelaCadastro.dart';

void main() {
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
 ));
  runApp(MenuInicial());
  //runApp(TelaCadastro());
}
