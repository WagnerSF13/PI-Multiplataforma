import 'package:flutter/material.dart';
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/CardResponsivo.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/NomesPath.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class MenuPerfil extends StatelessWidget {
  const MenuPerfil({super.key});

  Future<List<Map<String, dynamic>>> carregarPerfis() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('alunos').get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CoresCustomizadas.azul,
        appBar: AppBar(
          backgroundColor: CoresCustomizadas.azul,
          toolbarHeight: 90,
          title:
              TextoCustomizado(texto: "Escolha o Perfil", tamanhoFonte: 48.0),
          centerTitle: true,
          actions: [
            Align(
              alignment: Alignment.centerRight, // botão à direita
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16.0,
                ),
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
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: carregarPerfis(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: TextoCustomizado(
                  texto: "Erro ao carregar perfis.",
                  tamanhoFonte: 34.0,
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: TextoCustomizado(
                  texto: "Nenhum perfil encontrado.",
                  tamanhoFonte: 34.0,
                ),
              );
            }

            final perfis = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final perfil = perfis[index];
                      final nome = perfil['nome'] ?? "Sem Nome";
                      final imagemBase64 = perfil['imagemBase64'] ?? "";
                      final imagemBytes = imagemBase64.isNotEmpty
                          ? base64Decode(imagemBase64)
                          : null;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardResponsivo(
                          imagemBytes: imagemBytes,
                          texto: nome,
                          operacaoBotao: FuncaoBotao.telaMenuJogos,
                        ),
                      );
                    },
                    childCount: perfis.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
