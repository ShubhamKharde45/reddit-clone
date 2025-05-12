import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/screens/IntroScreen.dart';
import 'package:reddit_clone/utils/bottombar.dart';
import 'package:reddit_clone/utils/homescreenconst.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({super.key});

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      drawer: AppDrawer,
      bottomNavigationBar: BottomNavBar(),
      body: ListView(),
    );
  }
}
