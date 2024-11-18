import 'package:flutter/material.dart';
import 'package:semeador/MenuInicial.dart';
import 'package:flutter/services.dart';
import 'package:semeador/TelaCadastro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:semeador/TelaCadastroFim.dart';
import 'firebase_options.dart';
import 'package:semeador/TelaLogin.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MenuInicial());
  //runApp(TelaCadastro());
}
