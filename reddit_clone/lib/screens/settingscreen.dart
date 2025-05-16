import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingscreenUI extends StatefulWidget {
  const SettingscreenUI({super.key});

  @override
  State<SettingscreenUI> createState() => _SettingscreenUIState();
}

class _SettingscreenUIState extends State<SettingscreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IconButton(onPressed: () {
              
            }, icon: Icon(CupertinoIcons.add)),
          ],
        ),
      ),
    );
  }
}
