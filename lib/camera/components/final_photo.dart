import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FinalPhoto extends StatelessWidget {
  final XFile foto;

  final ColorFilter? filtro;

  const FinalPhoto({
    super.key,
    required this.foto,
    required this.filtro,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: const Color(0xFF526F8C),

        elevation: 1,

        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },

          child: const Text(
            'Back',

            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),

        title: const Text(
          'Share Photo',

          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ColorFiltered(
                colorFilter: filtro ??
                    const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.dst,
                    ),

                child: Image.file(
                  File(foto.path),

                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          Container(
            height: 70,

            color: const Color(0xFF151515),

            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF527493),

                  foregroundColor: Colors.white,

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(4),
                  ),
                ),

                child: const Text(
                  'Publicar',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}