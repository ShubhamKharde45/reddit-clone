import 'package:flutter/material.dart';
import 'package:reddit_clone/screens/IntroScreen.dart';
import 'package:reddit_clone/screens/homepagescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePageUI());
  }
}
