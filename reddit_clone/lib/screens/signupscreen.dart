import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/auth/authmanager.dart';
import 'package:reddit_clone/screens/loginscreen.dart';
import 'package:reddit_clone/utils/appflatbtn.dart';
import 'package:reddit_clone/utils/apptextfield.dart';

class SignupscreenUI extends StatefulWidget {
  const SignupscreenUI({super.key});

  @override
  State<SignupscreenUI> createState() => _SignupscreenUIState();
}

class _SignupscreenUIState extends State<SignupscreenUI> {
  bool isConditionsChecked = false;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController confirmpasscontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    usernamecontroller.dispose();
    passcontroller.dispose();
    confirmpasscontroller.dispose();
    super.dispose();
  }

  void signup() async {
    if (isConditionsChecked == true) {
      if (passcontroller.text.trim() == confirmpasscontroller.text.trim()) {
        final response = await AuthManager().SignUp(
          username: usernamecontroller.text.trim(),
          email: emailcontroller.text.trim(),
          password: passcontroller.text.trim(),
        );
        if (response == "Error") {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Invalid credentials")));
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreenUI()),
            (route) => false,
          );
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Account created.")));
        }
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Password does not matched.")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please accsept terms&conditions first.")),
      );
    }
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
            height: 800,
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
                        "Let's create an account",
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
                      Apptextfield(
                        hintext: "Username",
                        controller: usernamecontroller,
                      ),
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
                      SizedBox(height: 5),
                      Apptextfield(
                        hintext: "Confirm password",
                        controller: confirmpasscontroller,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Appflatbtn(
                    text: "LogIn",
                    onTap: () {
                      signup();
                    },
                  ),
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
                        "Already have an account?",
                        style: TextStyle(color: Colors.white54),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          " LogIn",
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
