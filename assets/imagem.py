from PIL import Image

def gerarImagens(pathImagem, pathCerto):
    nomeImagem = pathImagem.replace(".png", "")

    certo = Image.open(pathCerto)
    certo = certo.resize((100,100))

    imagem = Image.open(pathImagem).resize((100,100))
    imagem.save(nomeImagem + "100x100.png")

    imagemCima = imagem.crop((0, 0, 100, 50))
    imagemBaixo = imagem.crop((0, 50, 100, 100))
    imagem.paste(certo, (0, 0), certo)

    imagemCima.save(nomeImagem + "Cima.png")
    imagemBaixo.save(nomeImagem + "Baixo.png")
    imagem.save(nomeImagem + "Certo.png")


certoPath = "certo.png"
peraPath = "PeraOriginal.png"

gerarImagens(peraPath, certoPath)