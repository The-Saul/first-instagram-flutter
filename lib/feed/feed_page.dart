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
      // ------------------------------------------------
      // MENU SUPERIOR
      // ------------------------------------------------
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

      // ------------------------------------------------
      // FEED
      // ------------------------------------------------
      body: ListView(
        children: const [
          PostHeader(
            nomeUsuario: 'Saul_gay',
            corAvatar: Colors.blue,
          ),

          PostImage(
            imagem: 'lib/assets/saul.png',
            altura: 400,
          ),

          PostActions(),

          PostLikes(
            quantidade: 125,
          ),

          PostDescription(
            nomeUsuario: 'Saul_gay: ',
            descricao: 'Uma linda paisagem! 🏙️',
          ),

          SizedBox(height: 20),

          PostHeader(
            nomeUsuario: 'Ellie_&_Lia',
            corAvatar: Colors.orange,
          ),

          PostImage(
            imagem: 'lib/assets/ellielia.jpeg',
            altura: 300,
          ),

          SizedBox(height: 30),
          
          PostActions(),

          PostLikes(
            quantidade: 278,
          ),

          PostDescription(
            nomeUsuario: 'Ellie_&_Lia: ',
            descricao: 'faça a vida valer apena!',
          ),

          SizedBox(height: 20),

          PostHeader(
            nomeUsuario: 'Kevin_Systrom',
            corAvatar: Colors.orange,
          ),

          PostImage(
            imagem: 'lib/assets/Kevin_Systrom.jpg',
            altura: 300,
          ),

          SizedBox(height: 30),
          
          PostActions(),

          PostLikes(
            quantidade: 178,
          ),

          PostDescription(
            nomeUsuario: 'Kevin_Systrom: ',
            descricao: 'eu sou um dos criadores do Instagram!',
          ),

          SizedBox(height: 20),
          
          
          PostHeader(
            nomeUsuario: 'Mike_Kriger',
            corAvatar: Colors.orange,
          ),

          PostImage(
            imagem: 'lib/assets/Mike.jpeg',
            altura: 300,
          ),

          SizedBox(height: 30),
          
          PostActions(),

          PostLikes(
            quantidade: 198,
          ),

          PostDescription(
            nomeUsuario: 'Mike_Kriger: ',
            descricao: 'Br que ajudou a criar o Instagram!',
          ),

          SizedBox(height: 20),
          
        ],
      ),

      // ------------------------------------------------
      // MENU INFERIOR DO INSTAGRAM
      // ------------------------------------------------
      bottomNavigationBar: FeedBottomNavigation(
        indiceSelecionado: indiceSelecionado,
        onItemSelecionado: (index) {
          setState(() {
            indiceSelecionado = index;
          });
        },
      ),
    );
  }
}