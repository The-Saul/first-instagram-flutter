import 'package:flutter/material.dart';

class PostLikes extends StatelessWidget {
  final int quantidade;

  const PostLikes({
    super.key,
    required this.quantidade,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        'Curtido por $quantidade pessoas',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}