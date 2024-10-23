import "package:flutter/material.dart";

class ImagemFundo extends StatelessWidget{
  final String imagem;
  const ImagemFundo({super.key, required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagem),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}