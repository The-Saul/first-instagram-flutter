import 'package:flutter/material.dart';

class PostDescription extends StatelessWidget {
  final String nomeUsuario;
  final String descricao;

  const PostDescription({
    super.key,
    required this.nomeUsuario,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        '$nomeUsuario $descricao',
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}