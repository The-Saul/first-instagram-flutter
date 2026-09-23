import 'package:flutter/material.dart';

class CameraShutter extends StatelessWidget {
  final VoidCallback onPressed;

  const CameraShutter({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 78,
        height: 78,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF555555),
            width: 3,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFE5E5E5),
            border: Border.all(
              color: const Color(0xFF999999),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}