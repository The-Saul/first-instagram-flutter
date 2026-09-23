import 'package:flutter/material.dart';

class FeedBottomNavigation extends StatelessWidget {
  final int indiceSelecionado;

  const FeedBottomNavigation({
    super.key,
    required this.indiceSelecionado,
  });

  void _navegar(BuildContext context, int index) {
    if (index == indiceSelecionado) {
      return;
    }

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/feed');
        break;

      case 1:
        Navigator.pushReplacementNamed(context, '/popular');
        break;

      case 2:
        // Share será implementado depois.
        break;

      case 3:
        // News será implementado depois.
        break;

      case 4:
        // Perfil será implementado depois.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: const Color(0xFF3F3F3F),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _item(
            context,
            index: 0,
            icon: Icons.people_outline,
            activeIcon: Icons.people,
            label: 'Feed',
          ),

          _item(
            context,
            index: 1,
            icon: Icons.public_outlined,
            activeIcon: Icons.public,
            label: 'Popular',
          ),

          // CÂMERA DESTACADA
          _cameraItem(context),

          _item(
            context,
            index: 3,
            icon: Icons.article_outlined,
            activeIcon: Icons.article,
            label: 'News',
          ),

          _item(
            context,
            index: 4,
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: '@perfil',
          ),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final bool selecionado = indiceSelecionado == index;

    return Expanded(
      child: InkWell(
        onTap: () => _navegar(context, index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selecionado ? activeIcon : icon,
              size: 28,
              color: selecionado
                  ? Colors.white
                  : Colors.white70,
            ),

            const SizedBox(height: 3),

            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: selecionado
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: selecionado
                    ? Colors.white
                    : Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cameraItem(BuildContext context) {
    final bool selecionado = indiceSelecionado == 2;

    return Expanded(
      child: InkWell(
        onTap: () => _navegar(context, 2),
        child: Transform.translate(
          offset: const Offset(0, -8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: selecionado
                      ? Colors.white
                      : const Color(0xFF555555),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 29,
                  color: selecionado
                      ? const Color(0xFF3F3F3F)
                      : Colors.white,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                'Share',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: selecionado
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}