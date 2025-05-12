import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final List join_communities = [
  'Ask',
  'Askreddit',
  "BeAmazed",
  "Memes",
  'Ask',
  'Askreddit',
  "BeAmazed",
  "Memes",
  'Ask',
  'Askreddit',
  "BeAmazed",
  "Memes",
  'Ask',
  'Askreddit',
  "BeAmazed",
  "Memes",
];

AppBar appBar = AppBar(
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
    Padding(
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
  ],
);
Drawer AppDrawer = Drawer(
  backgroundColor: Colors.black,
  shadowColor: Colors.white,
  surfaceTintColor: Colors.white,
  child: Column(
    children: [
      SizedBox(height: 40),
      Divider(color: Colors.grey.shade800, thickness: 1),
      ListTile(
        leading: Icon(Icons.group),
        title: Text(
          "Discover Communities",
          style: TextStyle(color: Colors.white),
        ),
      ),
      Divider(color: Colors.grey.shade800, thickness: 1),
      ListTile(
        leading: Icon(CupertinoIcons.add, color: Colors.white),
        title: Text("Create a ommunity", style: TextStyle(color: Colors.white)),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: join_communities.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset('assets/images/Reddit-Logo-png.png'),
              title: Text(
                "r/" + join_communities[index].toString(),
                style: TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.star, color: Colors.white),
              ),
            );
          },
        ),
      ),
    ],
  ),
);

// BOTTOM BAR

