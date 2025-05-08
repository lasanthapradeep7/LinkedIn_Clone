import 'package:flutter/material.dart';
import 'package:linkedin_clone/screens/feed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Likedin Clone',
      debugShowCheckedModeBanner: false,
      home: FeedScreen(),
    );
  }
}
