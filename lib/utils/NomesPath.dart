class NomesPath {
  // Icones
  static const String play = "assets/play.svg";
  static const String usuario = "assets/usuario_icone.svg";
  static const String cancelar = "assets/cancelar.svg";
  static const String menu = "assets/menu.svg";
  static const String menuInicial = "assets/FundoMenuInicial.png";
  static const String fundoEscondido = "assets/escondidoFundo.png";
  static const String voltar = "assets/voltar.svg";

  static List<List<String>> gerarImagens(int numeroDeImagens) {
    List<List<String>> imagens = [];
    List<List<String>> tempImagens = List.from(todasImagens);
    tempImagens.shuffle();
    for (int i = 0; i < numeroDeImagens; i++) {
      imagens.add(tempImagens.removeLast());
    }
    return imagens;
  }

  static const String escondido = "assets/interrogacao.png";

  //Imagens
  // Codigo gerado automaticamente pelo script Python imagem.py
  static const String abelha = "assets/ImagensDosJogos/abelha.png";
  static const String abelhaCima = "assets/ImagensDosJogos/abelhaCima.png";
  static const String abelhaBaixo = "assets/ImagensDosJogos/abelhaBaixo.png";
  static const String abelhaCerto = "assets/ImagensDosJogos/abelhaCerto.png";
  static const List<String> abelhaGrupo = [
    abelha,
    abelhaCima,
    abelhaBaixo,
    abelhaCerto
  ];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String cachorro = "assets/ImagensDosJogos/cachorro.png";
  static const String cachorroCima = "assets/ImagensDosJogos/cachorroCima.png";
  static const String cachorroBaixo =
      "assets/ImagensDosJogos/cachorroBaixo.png";
  static const String cachorroCerto =
      "assets/ImagensDosJogos/cachorroCerto.png";
  static const List<String> cachorroGrupo = [
    cachorro,
    cachorroCima,
    cachorroBaixo,
    cachorroCerto
  ];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String cereja = "assets/ImagensDosJogos/cereja.png";
  static const String cerejaCima = "assets/ImagensDosJogos/cerejaCima.png";
  static const String cerejaBaixo = "assets/ImagensDosJogos/cerejaBaixo.png";
  static const String cerejaCerto = "assets/ImagensDosJogos/cerejaCerto.png";
  static const List<String> cerejaGrupo = [
    cereja,
    cerejaCima,
    cerejaBaixo,
    cerejaCerto
  ];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String coco = "assets/ImagensDosJogos/coco.png";
  static const String cocoCima = "assets/ImagensDosJogos/cocoCima.png";
  static const String cocoBaixo = "assets/ImagensDosJogos/cocoBaixo.png";
  static const String cocoCerto = "assets/ImagensDosJogos/cocoCerto.png";
  static const List<String> cocoGrupo = [coco, cocoCima, cocoBaixo, cocoCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String laranja = "assets/ImagensDosJogos/laranja.png";
  static const String laranjaCima = "assets/ImagensDosJogos/laranjaCima.png";
  static const String laranjaBaixo = "assets/ImagensDosJogos/laranjaBaixo.png";
  static const String laranjaCerto = "assets/ImagensDosJogos/laranjaCerto.png";
  static const List<String> laranjaGrupo = [
    laranja,
    laranjaCima,
    laranjaBaixo,
    laranjaCerto
  ];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String limao = "assets/ImagensDosJogos/limao.png";
  static const String limaoCima = "assets/ImagensDosJogos/limaoCima.png";
  static const String limaoBaixo = "assets/ImagensDosJogos/limaoBaixo.png";
  static const String limaoCerto = "assets/ImagensDosJogos/limaoCerto.png";
  static const List<String> limaoGrupo = [
    limao,
    limaoCima,
    limaoBaixo,
    limaoCerto
  ];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String maca = "assets/ImagensDosJogos/maca.png";
  static const String macaCima = "assets/ImagensDosJogos/macaCima.png";
  static const String macaBaixo = "assets/ImagensDosJogos/macaBaixo.png";
  static const String macaCerto = "assets/ImagensDosJogos/macaCerto.png";
  static const List<String> macaGrupo = [maca, macaCima, macaBaixo, macaCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String manga = "assets/ImagensDosJogos/manga.png";
  static const String mangaCima = "assets/ImagensDosJogos/mangaCima.png";
  static const String mangaBaixo = "assets/ImagensDosJogos/mangaBaixo.png";
  static const String mangaCerto = "assets/ImagensDosJogos/mangaCerto.png";
  static const List<String> mangaGrupo = [
    manga,
    mangaCima,
    mangaBaixo,
    mangaCerto
  ];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String pera = "assets/ImagensDosJogos/pera.png";
  static const String peraCima = "assets/ImagensDosJogos/peraCima.png";
  static const String peraBaixo = "assets/ImagensDosJogos/peraBaixo.png";
  static const String peraCerto = "assets/ImagensDosJogos/peraCerto.png";
  static const List<String> peraGrupo = [pera, peraCima, peraBaixo, peraCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String tigre = "assets/ImagensDosJogos/tigre.png";
  static const String tigreCima = "assets/ImagensDosJogos/tigreCima.png";
  static const String tigreBaixo = "assets/ImagensDosJogos/tigreBaixo.png";
  static const String tigreCerto = "assets/ImagensDosJogos/tigreCerto.png";
  static const List<String> tigreGrupo = [
    tigre,
    tigreCima,
    tigreBaixo,
    tigreCerto
  ];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String livro = "assets/ImagensDosJogos/livro.png";
  static const String livroCima = "assets/ImagensDosJogos/livroCima.png";
  static const String livroBaixo = "assets/ImagensDosJogos/livroBaixo.png";
  static const String livroCerto = "assets/ImagensDosJogos/livroCerto.png";
  static const List<String> livroGrupo = [
    livro,
    livroCima,
    livroBaixo,
    livroCerto
  ];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String mesa = "assets/ImagensDosJogos/mesa.png";
  static const String mesaCima = "assets/ImagensDosJogos/mesaCima.png";
  static const String mesaBaixo = "assets/ImagensDosJogos/mesaBaixo.png";
  static const String mesaCerto = "assets/ImagensDosJogos/mesaCerto.png";
  static const List<String> mesaGrupo = [mesa, mesaCima, mesaBaixo, mesaCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String pessego = "assets/ImagensDosJogos/pessego.png";
  static const String pessegoCima = "assets/ImagensDosJogos/pessegoCima.png";
  static const String pessegoBaixo = "assets/ImagensDosJogos/pessegoBaixo.png";
  static const String pessegoCerto = "assets/ImagensDosJogos/pessegoCerto.png";
  static const List<String> pessegoGrupo = [
    pessego,
    pessegoCima,
    pessegoBaixo,
    pessegoCerto
  ];

// Codigo gerado automaticamente pelo script Python imagem.py
  static const String pinguim = "assets/ImagensDosJogos/pinguim.png";
  static const String pinguimCima = "assets/ImagensDosJogos/pinguimCima.png";
  static const String pinguimBaixo = "assets/ImagensDosJogos/pinguimBaixo.png";
  static const String pinguimCerto = "assets/ImagensDosJogos/pinguimCerto.png";
  static const List<String> pinguimGrupo = [
    pinguim,
    pinguimCima,
    pinguimBaixo,
    pinguimCerto
  ];

  // Codigo gerado automaticamente pelo script Python imagem.py
static const String cavalo = "assets/ImagensDosJogos/cavalo.png";
static const String cavaloCima = "assets/ImagensDosJogos/cavaloCima.png";
static const String cavaloBaixo = "assets/ImagensDosJogos/cavaloBaixo.png";
static const String cavaloCerto = "assets/ImagensDosJogos/cavaloCerto.png";
static const List<String> cavaloGrupo = [cavalo, cavaloCima, cavaloBaixo, cavaloCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String lapis = "assets/ImagensDosJogos/lapis.png";
static const String lapisCima = "assets/ImagensDosJogos/lapisCima.png";
static const String lapisBaixo = "assets/ImagensDosJogos/lapisBaixo.png";
static const String lapisCerto = "assets/ImagensDosJogos/lapisCerto.png";
static const List<String> lapisGrupo = [lapis, lapisCima, lapisBaixo, lapisCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String macaco = "assets/ImagensDosJogos/macaco.png";
static const String macacoCima = "assets/ImagensDosJogos/macacoCima.png";
static const String macacoBaixo = "assets/ImagensDosJogos/macacoBaixo.png";
static const String macacoCerto = "assets/ImagensDosJogos/macacoCerto.png";
static const List<String> macacoGrupo = [macaco, macacoCima, macacoBaixo, macacoCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String melancia = "assets/ImagensDosJogos/melancia.png";
static const String melanciaCima = "assets/ImagensDosJogos/melanciaCima.png";
static const String melanciaBaixo = "assets/ImagensDosJogos/melanciaBaixo.png";
static const String melanciaCerto = "assets/ImagensDosJogos/melanciaCerto.png";
static const List<String> melanciaGrupo = [melancia, melanciaCima, melanciaBaixo, melanciaCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String morango = "assets/ImagensDosJogos/morango.png";
static const String morangoCima = "assets/ImagensDosJogos/morangoCima.png";
static const String morangoBaixo = "assets/ImagensDosJogos/morangoBaixo.png";
static const String morangoCerto = "assets/ImagensDosJogos/morangoCerto.png";
static const List<String> morangoGrupo = [morango, morangoCima, morangoBaixo, morangoCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String uva = "assets/ImagensDosJogos/uva.png";
static const String uvaCima = "assets/ImagensDosJogos/uvaCima.png";
static const String uvaBaixo = "assets/ImagensDosJogos/uvaBaixo.png";
static const String uvaCerto = "assets/ImagensDosJogos/uvaCerto.png";
static const List<String> uvaGrupo = [uva, uvaCima, uvaBaixo, uvaCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String ventilador = "assets/ImagensDosJogos/ventilador.png";
static const String ventiladorCima = "assets/ImagensDosJogos/ventiladorCima.png";
static const String ventiladorBaixo = "assets/ImagensDosJogos/ventiladorBaixo.png";
static const String ventiladorCerto = "assets/ImagensDosJogos/ventiladorCerto.png";
static const List<String> ventiladorGrupo = [ventilador, ventiladorCima, ventiladorBaixo, ventiladorCerto];

// Codigo gerado automaticamente pelo script Python imagem.py
static const String zebra = "assets/ImagensDosJogos/zebra.png";
static const String zebraCima = "assets/ImagensDosJogos/zebraCima.png";
static const String zebraBaixo = "assets/ImagensDosJogos/zebraBaixo.png";
static const String zebraCerto = "assets/ImagensDosJogos/zebraCerto.png";
static const List<String> zebraGrupo = [zebra, zebraCima, zebraBaixo, zebraCerto];


  static const List<List<String>> frutasImagens = [
    cerejaGrupo,
    cocoGrupo,
    laranjaGrupo,
    limaoGrupo,
    macaGrupo,
    mangaGrupo,
    melanciaGrupo,
    morangoGrupo,
    peraGrupo,
    pessegoGrupo,
    uvaGrupo
  ];
  static const List<List<String>> animaisImagens = [
    abelhaGrupo,
    cachorroGrupo,
    tigreGrupo,
    pinguimGrupo,
    cavaloGrupo,
    zebraGrupo,
    macacoGrupo
  ];
  static const List<List<String>> objetosImagens = [
    livroGrupo,
    mesaGrupo,
    lapisGrupo,
    ventiladorGrupo
    ];

  static const List<List<String>> todasImagens = [
    ...frutasImagens,
    ...animaisImagens,
    ...objetosImagens
  ];
}
