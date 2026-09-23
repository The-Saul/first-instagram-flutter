import 'package:flutter/material.dart';

import '../camera/camera_page.dart';

import 'components/feed_app_bar.dart';
import 'components/post_header.dart';
import 'components/post_image.dart';
import 'components/post_actions.dart';
import 'components/post_likes.dart';
import 'components/post_description.dart';
import 'components/feed_bottom_navigation.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int indiceSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // =========================================================
      // BARRA SUPERIOR
      // =========================================================

      appBar: FeedAppBar(
        onCameraPressed: () {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) {
                return const CameraPage();
              },
            ),
          );

        },
      ),

      // =========================================================
      // FEED
      // =========================================================

      body: ListView(
        children: const [

          PostHeader(
            nomeUsuario: 'mgoblue',
            corAvatar: Colors.blue,
          ),

          PostImage(
            imagem: 'lib/assets/cidade.jpg',
            altura: 400,
          ),

          PostActions(),

          PostLikes(
            quantidade: 125,
          ),

          PostDescription(
            nomeUsuario: 'mgoblue',
            descricao:
                'Uma linda paisagem da cidade! 🏙️',
          ),

          SizedBox(height: 20),

          PostHeader(
            nomeUsuario: 'usuario_flutter',
            corAvatar: Colors.orange,
          ),

          PostImage(
            altura: 300,
          ),

          SizedBox(height: 30),
        ],
      ),

      bottomNavigationBar: const FeedBottomNavigation(
        indiceSelecionado: 0,
      ),
    );
  }
}