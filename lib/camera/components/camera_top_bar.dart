import 'package:flutter/material.dart';

class CameraTopBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String titulo;
  final String textoEsquerda;
  final String textoDireita;

  final VoidCallback onEsquerda;
  final VoidCallback onDireita;

  const CameraTopBar({
    super.key,
    required this.titulo,
    required this.textoEsquerda,
    required this.textoDireita,
    required this.onEsquerda,
    required this.onDireita,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF7899BB),
            Color(0xFF496A86),
          ],
        ),

        border: Border(
          bottom: BorderSide(
            color: Color(0xFF30485D),
            width: 1,
          ),
        ),
      ),

      child: Row(
        children: [
          const SizedBox(width: 6),

          _OldCameraButton(
            texto: textoEsquerda,
            onPressed: onEsquerda,
          ),

          Expanded(
            child: Center(
              child: Text(
                titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      offset: Offset(0, 1),
                      blurRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),

          _OldCameraButton(
            texto: textoDireita,
            onPressed: onDireita,
          ),

          const SizedBox(width: 6),
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(54);
  }
}

class _OldCameraButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const _OldCameraButton({
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 6,
        ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),

          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6E8CA8),
              Color(0xFF4C6983),
            ],
          ),

          border: Border.all(
            color: Colors.white38,
          ),

          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),

        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}