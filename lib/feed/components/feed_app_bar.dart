import 'package:flutter/material.dart';

class FeedAppBar extends StatelessWidget
    implements PreferredSizeWidget {

  final VoidCallback onCameraPressed;

  const FeedAppBar({
    super.key,
    required this.onCameraPressed,
  });

  @override
  Widget build(BuildContext context) {

    return AppBar(

      backgroundColor: Colors.white,

      elevation: 1,

      centerTitle: true,

      title: const Text(
        'Instagram',

        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.black,
        ),
      ),

      actions: [

        IconButton(

          onPressed: onCameraPressed,

          icon: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.black,
          ),

        ),

      ],
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(
      kToolbarHeight,
    );
  }
}