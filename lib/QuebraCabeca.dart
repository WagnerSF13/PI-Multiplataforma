import 'package:flutter/material.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'package:semeador/utils/TextoCustomizado.dart';

class QuebraCabeca extends StatefulWidget {
  @override
  _QuebraCabecaState createState() => _QuebraCabecaState();
}

class _QuebraCabecaState extends State<QuebraCabeca> {
  List<int> pieces = List.generate(9, (index) => index); // 9 peças para 3x3
  int emptyIndex = 0;

  @override
  void initState() {
    super.initState();
    pieces.shuffle(); // Mistura as peças

    // Verifica se a configuração é resolvível
    while (!isSolvable(pieces)) {
      pieces.shuffle();
    }

    emptyIndex = pieces.indexOf(0); // Encontra o índice do espaço vazio
  }



//verifica mover as peças
  void movePiece(int index) {
    if (canMove(index)) {
      setState(() {
        pieces[emptyIndex] = pieces[index];
        pieces[index] = 0; // O espaço vazio agora ocupa a posição da peça
        emptyIndex = index; // Atualiza o índice do espaço vazio
      });


//ganhou, voltou pro menu
      if (isSolved()) {
        Navegacao.mudarTela(FuncaoBotao.telaPlacar, context);
          }
    
    }
  }

//boolean para verificar se pode mover a peça 
  bool canMove(int index) {
    int row = index ~/ 3;
    int col = index % 3;
    int emptyRow = emptyIndex ~/ 3;
    int emptyCol = emptyIndex % 3;

    return (row == emptyRow && (col - 1 == emptyCol || col + 1 == emptyCol)) || // Horizontal
           (col == emptyCol && (row - 1 == emptyRow || row + 1 == emptyRow)); // Vertical
  }



//verificação se foi resolvido/vetor para aprovação 
  bool isSolved() {
    for (int i = 0; i < pieces.length; i++) {
      final List<int> solution = [1, 2, 3, 4, 5, 6, 7, 8, 0];
      if (pieces[i] != solution[i]) {
        return false;
      }
    }
    return true;
  }



//verificação se é possivel resolver o quebra cabeca
  bool isSolvable(List<int> puzzle) {
    int inversions = 0;

    // Conta o número de inversões
    for (int i = 0; i < puzzle.length; i++) {
      if (puzzle[i] == 0) continue; // Ignora o espaço vazio
      for (int j = i + 1; j < puzzle.length; j++) {
        if (puzzle[j] != 0 && puzzle[i] > puzzle[j]) {
          inversions++;
        }
      }
    }

    // Posição do espaço vazio (linha contada de baixo para cima)
    int emptyRowFromBottom = 1 + (emptyIndex ~/ 3);

    // Verifica a condição de resolubilidade
    return (emptyRowFromBottom % 2 == 0) ? (inversions % 2 == 1) : (inversions % 2 == 0);
  }




//widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: TextoCustomizado(texto:"Quebra Cabeça", tamanhoFonte: 48.0))),
      body: Center(
        child: Container(
          width: 500, // Largura total do quebra-cabeça
          height: 500, // Altura total do quebra-cabeça
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1, // Mantém a proporção quadrada
            ),
            itemCount: pieces.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => movePiece(index),
                child: Container(
                  margin: EdgeInsets.all(2), // Ajuste o espaçamento entre os quadrados
                  color: CoresCustomizadas.azulEscuro,
                  child: Center(
                    child: TextoCustomizado(
                      texto: pieces[index] == 0 ? '' : '${pieces[index]}',
                      tamanhoFonte: 38.0 // Ajuste o tamanho da fonte
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
