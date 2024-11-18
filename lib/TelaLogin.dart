import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semeador/autenticacao_servico.dart';
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/CardResponsivo.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/NomesPath.dart';
import 'package:semeador/utils/Responsividade.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'dart:io';
import 'dart:typed_data';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _senhaFocusNode = FocusNode();

  AutenticacaoServico _autenServico = AutenticacaoServico();

void _login() {

}

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _senhaFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresCustomizadas.azul,
      appBar: AppBar(
        backgroundColor: CoresCustomizadas.azul,
        toolbarHeight: 120,
        title: Center(
            child: TextoCustomizado(texto: "Bem-vindo, professor(a)!", tamanhoFonte: 48.0)),
        actions: [
          Align(
            alignment:
                Alignment.centerRight, // botão à direita
            child: Padding(
              padding: EdgeInsets.only(right: 16.0,),
              child: BotaoAnimado(
                svgPath: NomesPath.cancelar,
                corBotao: CoresCustomizadas.amarelo,
                corSombra: CoresCustomizadas.amareloSombra,
                operacaoBotao: FuncaoBotao.telaMenuInicial,
                escalaTamanho: 0.075,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                child: Image.asset('assets/logoSemeador.png', width: 200, fit: BoxFit.cover,),
                ),
                SizedBox(height: 80),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Usuário',
                      labelStyle: TextStyle(color: CoresCustomizadas.azulEscuro),
                      filled: true,
                      fillColor: CoresCustomizadas.cinzaClaro,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu usuário';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _senhaController,
                    focusNode: _senhaFocusNode,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: CoresCustomizadas.azulEscuro),
                      filled: true,
                      fillColor: CoresCustomizadas.cinzaClaro,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                    backgroundColor: CoresCustomizadas.amarelo,
                  ),
                  onPressed: _login,
                  child: TextoCustomizado(
                    texto: "Login",
                    tamanhoFonte: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // botaoPrincipalClicado() { 
  //   String usuario = _emailController.text;
  //   String senha = _senhaController.text;
  //   if (_formKey.currentState!.validate()) {
  //     if (cadastrarUsuario) { 
  //       print("Entrada Validada");
  //     }else{
  //       print("Cadastro Validado");
  //       print("${_emailController}, ${_senhaController}");
  //       _autenServico.cadastrarUsuario(usuario: usuario, senha: senha);
  //     }
  //   } else {
  //     print("Cadastro Inválido");
  //   }
  // }
}
  
