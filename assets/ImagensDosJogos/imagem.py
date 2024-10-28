from PIL import Image
import os

def gerarImagens(pathImagem, pathCerto):
    nomeImagem = pathImagem.replace(".png", "")
    nomeImagem = nomeImagem.replace(".PNG", "")

    certo = Image.open(pathCerto)
    certo = certo.resize((100,100))

    nome100x100 = nomeImagem + "100x100.png"

    imagem = Image.open(pathImagem).resize((100,100))
    imagem.save(nome100x100)

    imagemCima = imagem.crop((0, 0, 100, 50))
    imagemBaixo = imagem.crop((0, 50, 100, 100))
    imagem.paste(certo, (0, 0), certo)

    novaImagemCima = Image.new("RGBA", (100, 100), (0, 0, 0, 0))  # Transparente
    novaImagemCima.paste(imagemCima, (0, 0))
    novaImagemBaixo = Image.new("RGBA", (100, 100), (0, 0, 0, 0))  # Transparente
    novaImagemBaixo.paste(imagemBaixo, (0, 0))

    nomeCima = nomeImagem + "Cima.png"
    nomeBaixo = nomeImagem + "Baixo.png"
    nomeCerto = nomeImagem + "Certo.png"

    novaImagemCima.save(nomeCima)
    novaImagemBaixo.save(nomeBaixo)
    imagem.save(nomeCerto)

    gerarCodigo(nomeImagem, nome100x100, nomeCima, nomeBaixo, nomeCerto)

def listarImagens():
    arquivos = os.listdir()
    listaImagens = []
    for arquivo in arquivos:
        if (arquivo.find(".png") > 1 or arquivo.find(".PNG") > 1): # se for imagem
            if (arquivo.find("Certo") == -1 and arquivo.find("Cima") == -1 and arquivo.find("Baixo") == -1): # Nao foi feita ainda
                listaImagens.append(arquivo)
    return listaImagens

def gerarCodigo(nome, original, cima, baixo, certo):
    nomeSemExtensao = nome.replace(".png", "")
    nomeSemExtensao = nomeSemExtensao.replace(".PNG", "")
    sufixo = "assets/ImagensDosJogos/"
    codigo = "// Codigo gerado automaticamente pelo script Python imagem.py\n"
    codigo += f"static const String {nomeSemExtensao} = \"{sufixo}{original}\";\n"
    codigo += f"static const String {nomeSemExtensao}Cima = \"{sufixo}{cima}\";\n"
    codigo += f"static const String {nomeSemExtensao}Baixo = \"{sufixo}{baixo}\";\n"
    codigo += f"static const String {nomeSemExtensao}Certo = \"{sufixo}{certo}\";\n"
    codigo += f"static const List<String> {nomeSemExtensao}Grupo = [{nomeSemExtensao}, {nomeSemExtensao}Cima, {nomeSemExtensao}Baixo, {nomeSemExtensao}Certo];\n\n"
    with open("CodigoGerado.txt", "a") as arquivo:
        arquivo.write(codigo)

certo = "CertoIcone.PNG"
imagens = listarImagens()
for imagem in imagens:
    gerarImagens(imagem, certo)