import 'package:flutter/material.dart';

class FeedBottomNavigation extends StatelessWidget {
  final int indiceSelecionado;
  final Function(int) onItemSelecionado;

  const FeedBottomNavigation({
    super.key,
    required this.indiceSelecionado,
    required this.onItemSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indiceSelecionado,

      onTap: onItemSelecionado,

      type: BottomNavigationBarType.fixed,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Pesquisar',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: 'Publicar',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Atividade',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Perfil',
        ),
      ],
    );
  }
}