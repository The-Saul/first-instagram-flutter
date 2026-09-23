import 'package:flutter/material.dart';

import 'camera_shutter.dart';

class CameraBottomBar extends StatelessWidget {
  final VoidCallback onTrocarCamera;
  final VoidCallback onTirarFoto;
  final VoidCallback onGaleria;

  const CameraBottomBar({
    super.key,
    required this.onTrocarCamera,
    required this.onTirarFoto,
    required this.onGaleria,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      decoration: const BoxDecoration(
        color: Color(0xFF151515),
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: onTrocarCamera,
            icon: const Icon(
              Icons.flip_camera_ios,
              color: Colors.white,
              size: 30,
            ),
          ),

          CameraShutter(
            onPressed: onTirarFoto,
          ),

          IconButton(
            onPressed: onGaleria,
            icon: const Icon(
              Icons.photo_library_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}