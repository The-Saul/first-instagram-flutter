import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final String? imagem;
  final double altura;

  const PostImage({
    super.key,
    this.imagem,
    required this.altura,
  });

  @override
  Widget build(BuildContext context) {
    if (imagem != null) {
      return Image.asset(
        imagem!,
        width: double.infinity,
        height: altura,
        fit: BoxFit.cover,
      );
    }

    return Container(
      width: double.infinity,
      height: altura,
      color: Colors.grey.shade300,
      child: const Center(
        child: Icon(
          Icons.image,
          size: 80,
          color: Colors.grey,
        ),
      ),
    );
  }
}
