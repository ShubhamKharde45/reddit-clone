import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/screens/profilepage.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "reddit",
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreenUI()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 5),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Reddit-Logo-png.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer,
      bottomNavigationBar: BottomNavBar(),
      body: ListView(),
    );
  }
}
