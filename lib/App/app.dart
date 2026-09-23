import 'package:flutter/material.dart';

import '../feed/feed_page.dart';
import '../popular/popular_page.dart';

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Instagram',

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),

      home: const FeedPage(),

      routes: {
        '/feed': (context) => const FeedPage(),
        '/popular': (context) => const PopularPage(),
      },
    );
  }
}