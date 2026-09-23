import 'package:flutter/material.dart';

class PopularAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PopularAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF5B8DB8),
      elevation: 1,
      centerTitle: true,

      title: const Text(
        'Popular',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}