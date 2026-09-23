import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'components/camera_top_bar.dart';
import 'components/filter_strip.dart';
import 'components/final_photo.dart';

import 'models/camera_filter.dart';

class FilterPage extends StatefulWidget {
  final XFile foto;

  const FilterPage({
    super.key,
    required this.foto,
  });

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int filtroSelecionado = 0;

  // ============================================================
  // FILTROS
  // ============================================================

  final List<CameraFilter> filtros = [
    const CameraFilter(
      nome: 'Normal',
    ),

    const CameraFilter(
      nome: 'X-Pro II',

      filtro: ColorFilter.matrix([
        1.20, 0, 0, 0, 8,
        0, 1.05, 0, 0, 0,
        0, 0, 0.80, 0, 0,
        0, 0, 0, 1, 0,
      ]),
    ),

    const CameraFilter(
      nome: 'Lomo-fi',

      filtro: ColorFilter.matrix([
        1.25, 0, 0, 0, 0,
        0, 1.05, 0, 0, 0,
        0, 0, 1.15, 0, 0,
        0, 0, 0, 1, 0,
      ]),
    ),

    const CameraFilter(
      nome: 'Earlybird',

      filtro: ColorFilter.matrix([
        1.05, 0, 0, 0, 20,
        0, 0.90, 0, 0, 10,
        0, 0, 0.70, 0, 0,
        0, 0, 0, 1, 0,
      ]),
    ),

    const CameraFilter(
      nome: '1977',

      filtro: ColorFilter.matrix([
        1.10, 0, 0, 0, 12,
        0, 0.92, 0, 0, 8,
        0, 0, 0.82, 0, 12,
        0, 0, 0, 1, 0,
      ]),
    ),

    const CameraFilter(
      nome: 'Kelvin',

      filtro: ColorFilter.matrix([
        1.15, 0, 0, 0, 15,
        0, 1.00, 0, 0, 5,
        0, 0, 0.70, 0, 0,
        0, 0, 0, 1, 0,
      ]),
    ),
  ];

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final filtroAtual =
        filtros[filtroSelecionado].filtro;

    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Column(
          children: [
            // --------------------------------------------------
            // BARRA SUPERIOR
            // --------------------------------------------------

            CameraTopBar(
              titulo: 'Filters',

              textoEsquerda: 'Back',

              textoDireita: 'Next',

              onEsquerda: () {
                Navigator.pop(context);
              },

              onDireita: _irParaProximaTela,
            ),

            // --------------------------------------------------
            // FOTO
            // --------------------------------------------------

            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,

                  child: ColorFiltered(
                    colorFilter: filtroAtual ??
                        const ColorFilter.mode(
                          Colors.transparent,
                          BlendMode.dst,
                        ),

                    child: Image.file(
                      File(
                        widget.foto.path,
                      ),

                      width: double.infinity,

                      height: double.infinity,

                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // --------------------------------------------------
            // FILTROS
            // --------------------------------------------------

            FilterStrip(
              filtros: filtros,

              selecionado:
                  filtroSelecionado,

              imagem:
                  widget.foto.path,

              onSelecionar: (index) {
                setState(() {
                  filtroSelecionado =
                      index;
                });
              },
            ),

            // --------------------------------------------------
            // FORMATO
            // --------------------------------------------------

            Container(
              height: 40,

              color: const Color(
                0xFF151515,
              ),

              child: const Center(
                child: Row(
                  mainAxisSize:
                      MainAxisSize.min,

                  children: [
                    Icon(
                      Icons.crop_square,
                      color: Colors.white,
                      size: 18,
                    ),

                    SizedBox(width: 7),

                    Text(
                      'Quadrado',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // NEXT
  // ============================================================

  void _irParaProximaTela() {
    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (_) {
          return FinalPhoto(
            foto: widget.foto,

            filtro:
                filtros[filtroSelecionado]
                    .filtro,
          );
        },
      ),
    );
  }
}