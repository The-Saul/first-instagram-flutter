import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewWidget extends StatelessWidget {
  final CameraController controller;

  const CameraPreviewWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }

    final previewSize =
        controller.value.previewSize;

    if (previewSize == null) {
      return CameraPreview(controller);
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,

      child: FittedBox(
        fit: BoxFit.cover,

        child: SizedBox(
          width: previewSize.height,
          height: previewSize.width,

          child: CameraPreview(
            controller,
          ),
        ),
      ),
    );
  }
}