import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.multiply, color: Colors.white, size: 30),
        ),
        actions: [
          Container(
            height: 35,
            width: 75,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                "Post",
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(
                      CupertinoIcons.add_circled,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Select a community",
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      CupertinoIcons.arrow_up_arrow_down_circle,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(
                      CupertinoIcons.add_circled,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Add tags",
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      CupertinoIcons.arrow_up_arrow_down_circle,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: TextField(
                  maxLines: 20,
                  decoration: InputDecoration(
                    hintText: "body text (optional)",
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width * 0.60,
                margin: EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.link, color: Colors.grey.shade600, size: 30),
                    Icon(Icons.image, color: Colors.grey.shade600, size: 30),
                    Icon(
                      Icons.video_call,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                    Icon(Icons.poll, color: Colors.grey.shade600, size: 30),
                    Icon(Icons.chat, color: Colors.grey.shade600, size: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
