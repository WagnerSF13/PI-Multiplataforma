import 'package:flutter/material.dart';
import 'package:semeador/utils/BotaoAnimado.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/NomesPath.dart';
import 'package:semeador/utils/Responsividade.dart';
import 'package:semeador/utils/TextoCustomizado.dart';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class MenuPerfilEditar extends StatelessWidget {
  const MenuPerfilEditar({super.key});

  /// Carrega os perfis dos alunos do Firestore.
  Future<List<Map<String, dynamic>>> carregarPerfis() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('alunos').get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id; // Adiciona o ID do documento ao mapa
      return data;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final double alturaToolbar = Responsividade.ehCelular(context) ? 60 : 120;

    return Scaffold(
      backgroundColor: CoresCustomizadas.azul,
      appBar: AppBar(
        backgroundColor: CoresCustomizadas.azul,
        toolbarHeight: alturaToolbar,
        leadingWidth: 120,
        title: TextoCustomizado(
          texto: "Escolha o Perfil",
          tamanhoFonte: 48.0,
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
          Align(
            alignment: Alignment.centerRight, // botão à direita
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
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
                    final String nome = perfil['nome'] ?? "Sem Nome";
                    final String imagemBase64 = perfil['imagemBase64'] ?? "";
                    final Uint8List? imagemBytes = imagemBase64.isNotEmpty
                        ? base64Decode(imagemBase64)
                        : null;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: cardEditar(context, imagemBytes, nome, perfil['id']),
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
    );
  }
  Widget cardEditar(BuildContext context, Uint8List? imagemBytes, String texto, String id){
  return GestureDetector(
      onTap: () {
            Navegacao.mudarTela(FuncaoBotao.telaEditarAluno, context, alunoId: id);
      },
      child: Container(
        width: Responsividade.ehCelular(context)
            ? 200
            : Responsividade.ehTablet(context)
                ? 400
                : 500,
        height: Responsividade.ehCelular(context)
            ? 200
            : Responsividade.ehTablet(context)
                ? 400
                : 500,
        color: CoresCustomizadas.azulEscuro,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.memory(imagemBytes!),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(child: TextoCustomizado(texto: texto,)),
            ),
          ],
        ),
      ),
    );
}
}



// child: GestureDetector(
//                         onTap: () {
//                           final alunoId = perfil['id'];
//                           print("isto");
//                           final nomeInicial = perfil['nome'];
//                           final imagemBase64Inicial = perfil['imagemBase64'];

//                           Navegacao.mudarTela(
//                             FuncaoBotao.telaEditarAluno,
//                             context,
//                             alunoId: alunoId,
//                             nomeInicial: nomeInicial,
//                             imagemBase64Inicial: imagemBase64Inicial,
//                           );
//                         },