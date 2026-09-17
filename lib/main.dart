import 'package:flutter/material.dart';

void main() {
  runApp(const InstagramApp());
}

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const FeedPage(),
    );
  }
}

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _indiceSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -------------------------
      // BARRA SUPERIOR
      // -------------------------
      appBar: AppBar(
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
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),

      // -------------------------
      // FEED
      // -------------------------
      body: ListView(
        children: [
          // Nome do usuário
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Foto de perfil
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 10),

                // Nome
                const Expanded(
                  child: Text(
                    'mgoblue',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                // Menu
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),

          // -------------------------
          // IMAGEM DA PUBLICAÇÃO
          // -------------------------
          Image.asset(
            'assets/cidade.jpg',
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
          ),

          // -------------------------
          // BOTÕES
          // -------------------------
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat_bubble_outline,
                    size: 28,
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send_outlined,
                    size: 28,
                  ),
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),

          // -------------------------
          // CURTIDAS
          // -------------------------
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Curtido por 125 pessoas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // -------------------------
          // DESCRIÇÃO
          // -------------------------
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'mgoblue Uma linda paisagem da cidade! 🏙️',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // -------------------------
          // SEGUNDA PUBLICAÇÃO
          // -------------------------
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 10),

                const Expanded(
                  child: Text(
                    'usuario_flutter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),

          Container(
            height: 300,
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(
                Icons.image,
                size: 80,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),

      // -------------------------
      // MENU INFERIOR
      // -------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceSelecionado,

        onTap: (index) {
          setState(() {
            _indiceSelecionado = index;
          });
        },

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
      ),
    );
  }
}