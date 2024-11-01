from PIL import Image

nomeOriginal = "escondido.png"
nomeFinal = "ic_launcher"
xxx = (192, 192)
xx = (144, 144)
x = (96, 96)
m = (48, 48)
h = (72, 72)

Image.open(nomeOriginal).resize(xxx).save(nomeFinal + "_xxx" + ".png")
Image.open(nomeOriginal).resize(xx).save(nomeFinal + "_xx" + ".png")
Image.open(nomeOriginal).resize(x).save(nomeFinal + "_x" + ".png")
Image.open(nomeOriginal).resize(m).save(nomeFinal + "_m" + ".png")
Image.open(nomeOriginal).resize(xxx).save(nomeFinal + "_h" + ".png")


