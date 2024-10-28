class NomesPath {
  // Icones
  static const String play = "assets/play.svg";
  static const String menu = "assets/menu.svg";
  static const String menuInicial = "assets/FundoMenuInicial.png";
  static const String fundoEscondido = "assets/escondidoFundo.png";

  static List<List<String>> gerarImagens(int numeroDeImagens){
    List<List<String>> imagens = [];
    List<List<String>> tempImagens = List.from(todasImagens);
    tempImagens.shuffle();
    for (int i = 0; i < numeroDeImagens; i++){
      imagens.add(tempImagens.removeLast());
    }
    return imagens;
  }

  // Jogo da memoria
  static const String escondido = "assets/escondido.png";
  static const String letraA = "assets/A.png";
  static const String letraB = "assets/B.png";
  static const String letraC = "assets/C.png";
  static const String letraD = "assets/D.png";
  static const String letraE = "assets/E.png";
  static const String letraF = "assets/F.png";
  static const String letraG = "assets/G.png";

  static const String letraAcerto = "assets/Acerto.png";
  static const String letraBcerto = "assets/Bcerto.png";
  static const String letraCcerto = "assets/Ccerto.png";
  static const String letraDcerto = "assets/Dcerto.png";
  static const String letraEcerto = "assets/Ecerto.png";
  static const String letraFcerto = "assets/Fcerto.png";
  static const String letraGcerto = "assets/Gcerto.png";

  static const List<String> letras = [letraA, letraB, letraC, letraD, letraE, letraF, letraG];
  static const List<String> letrasCerto = [letraAcerto, letraBcerto, letraCcerto, letraDcerto, letraEcerto, letraFcerto, letraGcerto];

  //Imagens
  // Codigo gerado automaticamente pelo script Python imagem.py
static const String abelha = "assets/ImagensDosJogos/abelha100x100.png";
static const String abelhaCima = "assets/ImagensDosJogos/abelhaCima.png";
static const String abelhaBaixo = "assets/ImagensDosJogos/abelhaBaixo.png";
static const String abelhaCerto = "assets/ImagensDosJogos/abelhaCerto.png";
static const List<String> abelhaGrupo = [abelha, abelhaCima, abelhaBaixo, abelhaCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String cachorro = "assets/ImagensDosJogos/cachorro100x100.png";
static const String cachorroCima = "assets/ImagensDosJogos/cachorroCima.png";
static const String cachorroBaixo = "assets/ImagensDosJogos/cachorroBaixo.png";
static const String cachorroCerto = "assets/ImagensDosJogos/cachorroCerto.png";
static const List<String> cachorroGrupo = [cachorro, cachorroCima, cachorroBaixo, cachorroCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String cereja = "assets/ImagensDosJogos/cereja100x100.png";
static const String cerejaCima = "assets/ImagensDosJogos/cerejaCima.png";
static const String cerejaBaixo = "assets/ImagensDosJogos/cerejaBaixo.png";
static const String cerejaCerto = "assets/ImagensDosJogos/cerejaCerto.png";
static const List<String> cerejaGrupo = [cereja, cerejaCima, cerejaBaixo, cerejaCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String coco = "assets/ImagensDosJogos/coco100x100.png";
static const String cocoCima = "assets/ImagensDosJogos/cocoCima.png";
static const String cocoBaixo = "assets/ImagensDosJogos/cocoBaixo.png";
static const String cocoCerto = "assets/ImagensDosJogos/cocoCerto.png";
static const List<String> cocoGrupo = [coco, cocoCima, cocoBaixo, cocoCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String laranja = "assets/ImagensDosJogos/laranja100x100.png";
static const String laranjaCima = "assets/ImagensDosJogos/laranjaCima.png";
static const String laranjaBaixo = "assets/ImagensDosJogos/laranjaBaixo.png";
static const String laranjaCerto = "assets/ImagensDosJogos/laranjaCerto.png";
static const List<String> laranjaGrupo = [laranja, laranjaCima, laranjaBaixo, laranjaCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String limao = "assets/ImagensDosJogos/limao100x100.png";
static const String limaoCima = "assets/ImagensDosJogos/limaoCima.png";
static const String limaoBaixo = "assets/ImagensDosJogos/limaoBaixo.png";
static const String limaoCerto = "assets/ImagensDosJogos/limaoCerto.png";
static const List<String> limaoGrupo = [limao, limaoCima, limaoBaixo, limaoCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String maca = "assets/ImagensDosJogos/maca100x100.png";
static const String macaCima = "assets/ImagensDosJogos/macaCima.png";
static const String macaBaixo = "assets/ImagensDosJogos/macaBaixo.png";
static const String macaCerto = "assets/ImagensDosJogos/macaCerto.png";
static const List<String> macaGrupo = [maca, macaCima, macaBaixo, macaCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String manga = "assets/ImagensDosJogos/manga100x100.png";
static const String mangaCima = "assets/ImagensDosJogos/mangaCima.png";
static const String mangaBaixo = "assets/ImagensDosJogos/mangaBaixo.png";
static const String mangaCerto = "assets/ImagensDosJogos/mangaCerto.png";
static const List<String> mangaGrupo = [manga, mangaCima, mangaBaixo, mangaCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String pera = "assets/ImagensDosJogos/pera100x100.png";
static const String peraCima = "assets/ImagensDosJogos/peraCima.png";
static const String peraBaixo = "assets/ImagensDosJogos/peraBaixo.png";
static const String peraCerto = "assets/ImagensDosJogos/peraCerto.png";
static const List<String> peraGrupo = [pera, peraCima, peraBaixo, peraCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String tigre = "assets/ImagensDosJogos/tigre100x100.png";
static const String tigreCima = "assets/ImagensDosJogos/tigreCima.png";
static const String tigreBaixo = "assets/ImagensDosJogos/tigreBaixo.png";
static const String tigreCerto = "assets/ImagensDosJogos/tigreCerto.png";
static const List<String> tigreGrupo = [tigre, tigreCima, tigreBaixo, tigreCerto];

static const List<List<String>> frutasImagens = [cerejaGrupo, cocoGrupo, laranjaGrupo, limaoGrupo, macaGrupo, mangaGrupo, peraGrupo];
static const List<List<String>> animaisImagens = [abelhaGrupo, cachorroGrupo, tigreGrupo];

static const List<List<String>> todasImagens = [...frutasImagens, ...animaisImagens];
}