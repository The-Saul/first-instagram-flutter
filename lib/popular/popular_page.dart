import 'package:flutter/material.dart';

import '../feed/components/feed_bottom_navigation.dart';
import 'components/popular_app_bar.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({super.key});

  final List<String> imagens = const [
    'https://picsum.photos/300/300?random=1',
    'https://picsum.photos/300/300?random=2',
    'https://picsum.photos/300/300?random=3',
    'https://picsum.photos/300/300?random=4',
    'https://picsum.photos/300/300?random=5',
    'https://picsum.photos/300/300?random=6',
    'https://picsum.photos/300/300?random=7',
    'https://picsum.photos/300/300?random=8',
    'https://picsum.photos/300/300?random=9',
    'https://picsum.photos/300/300?random=10',
    'https://picsum.photos/300/300?random=11',
    'https://picsum.photos/300/300?random=12',
    'https://picsum.photos/300/300?random=13',
    'https://picsum.photos/300/300?random=14',
    'https://picsum.photos/300/300?random=15',
    'https://picsum.photos/300/300?random=16',
    'https://picsum.photos/300/300?random=17',
    'https://picsum.photos/300/300?random=18',
    'https://picsum.photos/300/300?random=19',
    'https://picsum.photos/300/300?random=20',
    'https://picsum.photos/300/300?random=21',
    'https://picsum.photos/300/300?random=22',
    'https://picsum.photos/300/300?random=23',
    'https://picsum.photos/300/300?random=24',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: const PopularAppBar(),

      body: GridView.builder(
        padding: EdgeInsets.all(6),

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),

        itemCount: imagens.length,

        itemBuilder: (context, index) {
          return Image.network(
            imagens[index],
            fit: BoxFit.cover,
          );
        },
      ),

      bottomNavigationBar: FeedBottomNavigation(
        indiceSelecionado: 1,
        onItemSelecionado: (_) {},
      ),
    );
  }
}