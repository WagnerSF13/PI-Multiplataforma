class NomesPath {
  // Icones
  static const String play = "assets/play.svg";
  static const String menu = "assets/menu.svg";
  static const String menuInicial = "assets/FundoMenuInicial.png";


  // Jogo da memoria
  static const String escondido = "assets/escondido.png";
  static const String letraA = "assets/A.png";
  static const String letraB = "assets/B.png";
  static const String letraC = "assets/C.png";
  static const String letraD = "assets/D.png";
  static const String letraF = "assets/F.png";
  static const String letraG = "assets/G.png";

  static const String letraAcerto = "assets/Acerto.png";
  static const String letraBcerto = "assets/Bcerto.png";
  static const String letraCcerto = "assets/Ccerto.png";
  static const String letraDcerto = "assets/Dcerto.png";
  static const String letraFcerto = "assets/Fcerto.png";
  static const String letraGcerto = "assets/Gcerto.png";

  static const List<String> letras = [letraA, letraB, letraC, letraD, letraF, letraG];

  static const List<String> letrasCerto = [letraAcerto, letraBcerto, letraCcerto, letraDcerto, letraFcerto, letraGcerto];

  static List<String> gerarLetrasCorretas(List<String> letrasGeradas){
    final List<String> letrasCorretas = [];
    for (int i = 0; i < letrasGeradas.length; i++){
      letrasCorretas.add(letrasGeradas[i].replaceAll(".png", "") + "certo.png");
    }
    return letrasCorretas;
  }
}