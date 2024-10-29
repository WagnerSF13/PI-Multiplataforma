import 'package:flutter/material.dart';
import 'package:semeador/utils/ImagemFundo.dart';
import 'package:semeador/utils/Navegacao.dart';
import 'utils/NomesPath.dart';



class QuebraCabeca extends StatefulWidget {
    @override
    _QuebracabecaState createState() => _QuebracabecaState();
}

class _QuebracabecaState extends State<QuebraCabeca> {

    List<int> pieces = List.generate(8, (index) => index); // Exemplo para 4x4
    int emptyIndex = 0;
  @override
  void initState() {
    super.initState();
    pieces.shuffle(); // Mistura as peças
    emptyIndex = pieces.indexOf(0); // Encontra o índice do espaço vazio
}


void movePiece(int index) {
    // Lógica para mover as peças
    // implementar a verificação de movimentos válidos

    bool canMove(int index) {
    // Calcula a linha e a coluna da peça
    int row = index ~/ 4;
    int col = index % 4;

    // Calcula a linha e a coluna do espaço vazio
    int emptyRow = emptyIndex ~/ 4;
    int emptyCol = emptyIndex % 4;

    // Verifica se a peça está adjacente ao espaço vazio
    return (row == emptyRow && (col - 1 == emptyCol || col + 1 == emptyCol)) || // Horizontal
           (col == emptyCol && (row - 1 == emptyRow || row + 1 == emptyRow)); // Vertical
  }
    
    
    
     
    if (canMove(index)) {
      setState(() {
        // Troca a posição da peça com o espaço vazio
        pieces[emptyIndex] = pieces[index];
        pieces[index] = 0; // O espaço vazio agora ocupa a posição da peça
        emptyIndex = index; // Atualiza o índice do espaço vazio
      });
    }
  

    











  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quebra Cabeca')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: pieces.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => movePiece(index),
            child: Container(
              margin: EdgeInsets.all(2),
              color: const Color.fromARGB(255, 1, 17, 30),
              child: Center(
                child: Text(pieces[index] == 0 ? '' : '${pieces[index]}',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
              ),
            ),
          );
        },
      ),
    );
  }
}