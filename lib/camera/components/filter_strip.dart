import 'package:flutter/material.dart';

import '../models/camera_filter.dart';
import 'filter_item.dart';

class FilterStrip extends StatelessWidget {
  final List<CameraFilter> filtros;

  final int selecionado;

  final String imagem;

  final Function(int) onSelecionar;

  const FilterStrip({
    super.key,
    required this.filtros,
    required this.selecionado,
    required this.imagem,
    required this.onSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,

      decoration: const BoxDecoration(
        color: Color(0xFF151515),

        border: Border(
          top: BorderSide(
            color: Colors.black,
          ),
        ),
      ),

      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        padding: const EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 6,
        ),

        itemCount: filtros.length,

        itemBuilder: (context, index) {
          final filtro = filtros[index];

          return Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),

            child: FilterItem(
              nome: filtro.nome,

              imagem: imagem,

              filtro: filtro.filtro,

              selecionado:
                  selecionado == index,

              onTap: () {
                onSelecionar(index);
              },
            ),
          );
        },
      ),
    );
  }
}