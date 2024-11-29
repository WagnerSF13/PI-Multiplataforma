import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/CardResponsivo.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/NomesPath.dart';
import 'package:semeador/utils/Responsividade.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';

class TelaCadastroProfessor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _senhaFocusNode = FocusNode();

  void _cadastrarUsuario() async {
    if (_formKey.currentState!.validate()) {
      if (_senhaController.text != _confirmarSenhaController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('As senhas não coincidem.', textAlign: TextAlign.center),
          ),
        );
        return;
      }

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _senhaController.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cadastro realizado com sucesso!',
                textAlign: TextAlign.center),
          ),
        );
      } on FirebaseAuthException catch (e) {
        String mensagemErro;

        if (e.code == 'email-already-in-use') {
          mensagemErro = 'O e-mail informado já está em uso.';
        } else if (e.code == 'invalid-email') {
          mensagemErro = 'O e-mail informado é inválido.';
        } else if (e.code == 'weak-password') {
          mensagemErro = 'A senha é muito fraca. Escolha uma senha mais forte.';
        } else {
          mensagemErro = 'Erro ao realizar o cadastro. Tente novamente.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mensagemErro, textAlign: TextAlign.center),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro inesperado. Tente novamente.',
                textAlign: TextAlign.center),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _senhaFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double fonte = Responsividade.ehCelular(context) ? 30 : 48;
    double alturaToolbar = Responsividade.ehCelular(context) ? 60 : 120;
    return Scaffold(
      backgroundColor: CoresCustomizadas.azul,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: alturaToolbar,
        leadingWidth: 120,
        
        title: TextoCustomizado(
          texto: "Cadastro de Professor",
          tamanhoFonte: fonte,
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0), // Espaçamento à esquerda
          child: SizedBox(
            width: 56.0, // Largura padrão para o espaço do leading
            height: 56.0, // Altura padrão para o espaço do leading
            child: BotaoAnimado(
              svgPath: NomesPath.voltar,
              corBotao: CoresCustomizadas.amarelo,
              corSombra: CoresCustomizadas.amareloSombra,
              operacaoBotao: FuncaoBotao.telaCadastro,
              escalaTamanho: 0.075,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0), // Espaçamento à direita
            child: BotaoAnimado(
              svgPath: NomesPath.cancelar,
              corBotao: CoresCustomizadas.amarelo,
              corSombra: CoresCustomizadas.amareloSombra,
              operacaoBotao: FuncaoBotao.telaMenuInicial,
              escalaTamanho: 0.075,
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
                if (!Responsividade.ehCelular(context))
                  ClipOval(
                    child: Image.asset(
                      'assets/logoSemeador.png',
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (!Responsividade.ehCelular(context)) SizedBox(height: 40),
                _buildCadastroForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCadastroForm(BuildContext context) {
    double width = Responsividade.ehCelular(context) ? 240 : 350;
    double largBotao = Responsividade.ehCelular(context) ? 240 : 350;
    double buttonFontSize = Responsividade.ehCelular(context) ? 18 : 24;
    double vertical = Responsividade.ehCelular(context) ? 12 : 20;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: vertical),
          child: SizedBox(
            width: width,
            child: TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: CoresCustomizadas.azulEscuro),
                filled: true,
                fillColor: CoresCustomizadas.cinzaClaro,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: vertical, horizontal: 16.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu e-mail';
                }
                return null;
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: vertical),
          child: SizedBox(
            width: width,
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
                contentPadding:
                    EdgeInsets.symmetric(vertical: vertical, horizontal: 16.0),
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
        ),
        Padding(
          padding: EdgeInsets.only(bottom: vertical),
          child: SizedBox(
            width: width,
            child: TextFormField(
              controller: _confirmarSenhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                labelStyle: TextStyle(color: CoresCustomizadas.azulEscuro),
                filled: true,
                fillColor: CoresCustomizadas.cinzaClaro,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: vertical, horizontal: 16.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, confirme sua senha';
                }
                return null;
              },
            ),
          ),
        ),
        SizedBox(
          width: largBotao,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              backgroundColor: CoresCustomizadas.amarelo,
            ),
            onPressed: _cadastrarUsuario,
            child: TextoCustomizado(
              texto: "Cadastrar",
              tamanhoFonte: buttonFontSize,
            ),
          ),
        ),
      ],
    );
  }
}
