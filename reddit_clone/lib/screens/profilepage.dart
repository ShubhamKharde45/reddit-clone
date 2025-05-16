import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/providers/authprovider.dart';

class ProfileScreenUI extends ConsumerStatefulWidget {
  const ProfileScreenUI({super.key});

  @override
  ConsumerState<ProfileScreenUI> createState() => _ProfileScreenUIState();
}

class _ProfileScreenUIState extends ConsumerState<ProfileScreenUI> {
  @override
  Widget build(BuildContext context) {
    final username = ref.watch(UserNotifierProvider)?.UserName;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Consumer(
            builder: (context, ref, child) {
              if (username != null) {
                return Text(
                  "",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                );
              }
              return Text(
                "Error",
                style: TextStyle(color: Colors.white, fontSize: 25),
              );
            },
          ),
        ),
      ),
    );
  }
}
