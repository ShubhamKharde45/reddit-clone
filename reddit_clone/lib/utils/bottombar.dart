import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/screens/chatscreen.dart';
import 'package:reddit_clone/screens/createscreen.dart';
import 'package:reddit_clone/screens/homepagescreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int selectedTab = 1;
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      unselectedItemColor: Colors.grey.shade100,
      selectedItemColor: Colors.deepOrange,
      onTap: (value) {
        if (value == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePageUI()),
          );
          setState(() {
            selectedTab = value;
          });
        }
        if (value == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateScreen()),
          );
          setState(() {
            selectedTab = value;
          });
        }
        if (value == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
          setState(() {
            selectedTab = value;
          });
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.ant_circle),
          label: "Answers",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.add),
          label: "create",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble),
          label: "chat",
        ),

        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bell),
          label: "Inbox",
        ),
      ],
    );
  }
}
