import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/providers/authprovider.dart';
import 'package:reddit_clone/screens/loginscreen.dart';
import 'package:reddit_clone/utils/infobartext.dart';

class ProfileScreenUI extends ConsumerStatefulWidget {
  const ProfileScreenUI({super.key});

  @override
  ConsumerState<ProfileScreenUI> createState() => _ProfileScreenUIState();
}

class _ProfileScreenUIState extends ConsumerState<ProfileScreenUI> {
  @override
  Widget build(BuildContext context) {
    final prov = ref.watch(UserNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  if (prov?.UserName != null) {
                    return Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/Reddit-Logo-png.png',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Infobartext(
                          text: "Username",
                          text2: prov?.UserName ?? "Null",
                        ),
                        Infobartext(
                          text: "Email",
                          text2: prov?.UserEmail ?? "Null",
                        ),
                        SizedBox(height: 100),
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .watch(UserNotifierProvider.notifier)
                                .logOutUser();
                            ref
                                .read(UserNotifierProvider)
                                ?.copyWith(status: false);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreenUI(),
                              ),
                              (route) => false,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Logged Out")),
                            );
                          },
                          child: Icon(
                            CupertinoIcons.down_arrow,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  }
                  return Text(
                    "Error",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
