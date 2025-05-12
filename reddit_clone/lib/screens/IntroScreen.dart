import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/screens/homepagescreen.dart';

class IntroscreenUI extends StatefulWidget {
  IntroscreenUI({super.key});

  @override
  State<IntroscreenUI> createState() => _IntroscreenUIState();
}

class _IntroscreenUIState extends State<IntroscreenUI> {
  bool isConditionsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePageUI()),
              );
            },
            icon: Icon(CupertinoIcons.forward, color: Colors.white, size: 25),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 600,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          // color: Colors.yellowAccent,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Reddit-Logo-png.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login to Reddit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Icon(
                            CupertinoIcons.profile_circled,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Continue with mobile number",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Icon(
                            CupertinoIcons.profile_circled,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Continue with Google",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Icon(
                            CupertinoIcons.profile_circled,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Use email and pasword",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Checkbox(
                        value: isConditionsChecked,
                        onChanged: (value) {
                          setState(() {
                            isConditionsChecked = !isConditionsChecked;
                          });
                        },
                        checkColor: Colors.red,
                        activeColor: Colors.white,
                      ),
                      Text(
                        "I agree to receive emails about cool stuff on Reddit.",
                        style: TextStyle(
                          color:
                              isConditionsChecked
                                  ? Colors.white
                                  : Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade600,
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white54),
                      ),
                      Text(" Sign up", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
