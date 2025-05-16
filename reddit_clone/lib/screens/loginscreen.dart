import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/auth/authmanager.dart';
import 'package:reddit_clone/providers/authprovider.dart';
import 'package:reddit_clone/screens/homepagescreen.dart';
import 'package:reddit_clone/screens/signupscreen.dart';
import 'package:reddit_clone/utils/appflatbtn.dart';
import 'package:reddit_clone/utils/apptextfield.dart';

class LoginScreenUI extends ConsumerStatefulWidget {
  const LoginScreenUI({super.key});

  @override
  ConsumerState<LoginScreenUI> createState() => _LoginScreenUIState();
}

class _LoginScreenUIState extends ConsumerState<LoginScreenUI> {
  bool isConditionsChecked = true;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  void LogIn() async {
    if (isConditionsChecked == true) {
      final response = await AuthManager().LogIn(
        email: emailcontroller.text.trim(),
        password: passcontroller.text.trim(),
      );
      if (response == "Error") {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Invalid credentials")));
      } else {
        ref.read(AuthStatusProvider.notifier).state = true;
        LogInLocally(
          email: emailcontroller.text.trim(),
          username: response['UserName'],
          userpublicUUID: response['UserPublicUUID'],
          isActive: true,
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePageUI()),
          (route) => false,
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Logged In.")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please accsept terms&conditions first.")),
      );
    }
  }

  void LogInLocally({
    required String username,
    required String email,
    required String userpublicUUID,
    required bool isActive,
  }) {
    ref
        .read(UserNotifierProvider.notifier)
        .loginUser(
          UserName: username,
          UserEmail: email,
          UserPublicUUID: userpublicUUID,
          UserStatus: isActive,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.settings, color: Colors.white, size: 25),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SizedBox(
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
                      SizedBox(height: 15),
                      Apptextfield(
                        hintext: "Email",
                        controller: emailcontroller,
                      ),
                      SizedBox(height: 5),
                      Apptextfield(
                        hintext: "Password",
                        controller: passcontroller,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Appflatbtn(
                    text: "LogIn",
                    onTap: () {
                      LogIn();
                    },
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupscreenUI(),
                            ),
                          );
                        },
                        child: Text(
                          " Sign up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
