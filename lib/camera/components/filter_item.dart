import 'dart:io';

import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final String nome;
  final String imagem;
  final ColorFilter? filtro;

  final bool selecionado;

  final VoidCallback onTap;

  const FilterItem({
    super.key,
    required this.nome,
    required this.imagem,
    required this.filtro,
    required this.selecionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget miniatura = Image.file(
      File(imagem),

      width: 60,
      height: 60,

      fit: BoxFit.cover,
    );

    if (filtro != null) {
      miniatura = ColorFiltered(
        colorFilter: filtro!,
        child: miniatura,
      );
    }

    return GestureDetector(
      onTap: onTap,

      child: SizedBox(
        width: 74,

        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2),

              decoration: BoxDecoration(
                border: Border.all(
                  color: selecionado
                      ? Colors.white
                      : Colors.transparent,

                  width: 2,
                ),
              ),

              child: miniatura,
            ),

            const SizedBox(height: 3),

            Text(
              nome,

              maxLines: 1,

              overflow: TextOverflow.ellipsis,

              style: TextStyle(
                color: Colors.white,

                fontSize: 10,

                fontWeight: selecionado
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}