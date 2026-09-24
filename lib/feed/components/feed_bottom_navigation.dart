import 'package:flutter/material.dart';
import 'package:first_instagram_flutter/popular/popular_page.dart'; 
import 'package:first_instagram_flutter/feed/feed_page.dart';
import 'package:first_instagram_flutter/camera/camera_page.dart';

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
    return Container(
      height: 82,
      decoration: const BoxDecoration(
        color: Color(0xFF303030),
        border: Border(
          top: BorderSide(
            color: Color(0xFF555555),
            width: 1,
          ),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ==========================================
          // ITENS DO MENU
          // ==========================================
          Row(
            children: [
              // FEED
              Expanded(
                child: _MenuItem(
                  indice: 0,
                  selecionado: indiceSelecionado == 0,
                  icone: Icons.people,
                  texto: 'Feed',
                  onTap: () {
                    onItemSelecionado(0);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const FeedPage();
                        },
                      )
                    );
                  },
                ),
              ),

              // POPULAR
              Expanded(
  child: _MenuItem(
    indice: 1,
    selecionado: indiceSelecionado == 1,
    icone: Icons.public,
    texto: 'Popular',
    onTap: () {
      onItemSelecionado(1);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const PopularPage();
          },
        ),
      );
    },
  ),
),

              // ESPAÇO DA CÂMERA
              const Expanded(
                child: SizedBox(
                ),
              
              ),

              // NEWS
              Expanded(
                child: _MenuItem(
                  indice: 3,
                  selecionado: indiceSelecionado == 3,
                  icone: Icons.article_outlined,
                  texto: 'News',
                  onTap: () {
                    onItemSelecionado(3);
                  },
                ),
              ),

              // PERFIL
              Expanded(
                child: _MenuItem(
                  indice: 4,
                  selecionado: indiceSelecionado == 4,
                  icone: Icons.person_outline,
                  texto: '@perfil',
                  onTap: () {
                    onItemSelecionado(4);
                  },
                ),
              ),
            ],
          ),

          // ==========================================
          // CÂMERA CENTRAL
          // ==========================================
          Positioned(
            top: -22,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  onItemSelecionado(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CameraPage();
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF3A3A3A),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF555555),
                          border: Border.all(
                            color: Colors.white70,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                    

                    const SizedBox(height: 3),

                    Text(
                      'Share',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================================================
// ITEM NORMAL DO MENU
// ==================================================

class _MenuItem extends StatelessWidget {
  final int indice;
  final bool selecionado;
  final IconData icone;
  final String texto;
  final VoidCallback onTap;

  const _MenuItem({
    required this.indice,
    required this.selecionado,
    required this.icone,
    required this.texto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 82,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icone,
              size: 29,
              color: selecionado
                  ? Colors.white
                  : const Color(0xFFBDBDBD),
            ),

            const SizedBox(height: 3),

            Text(
              texto,
              style: TextStyle(
                color: selecionado
                    ? Colors.white
                    : const Color(0xFFBDBDBD),
                fontSize: 11,
                fontWeight: selecionado
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}