import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:semeador/utils/CoresCustomizadas.dart';
import 'package:semeador/utils/NomesPath.dart';
import 'package:semeador/utils/TextoCustomizado.dart';

class MenuPerfil extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Carousel();
  }
}

class Carousel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<Widget> imagens = [];
    for (int i = 0; i < NomesPath.letras.length; i++){
      imagens.add(criaWidget(NomesPath.letras[i]));
    }
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [ImagemFundo(),
          Center(
          child: CarouselSlider(
            options: CarouselOptions(
              height: 300,
              autoPlay: false,
              enlargeCenterPage: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.3,
            ),
            items: imagens.map((item) {
            return Container(
              child: item,
            );
          }).toList(),
          ),
        ),
          ],
        )
      ),
    );
  }

  Widget criaWidget(String imagemPath){
    return Container(
      color: CoresCustomizadas.azulPerfil,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(imagemPath), TextoCustomizado(texto: "Nome", escalaTamanho: 0.03)],
        )
      ),
    );
  }
}

class ImagemFundo extends StatelessWidget{
  const ImagemFundo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(NomesPath.menuInicial),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}