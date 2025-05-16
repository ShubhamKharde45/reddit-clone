import 'package:flutter/material.dart';

class Apptextfield extends StatelessWidget {
  const Apptextfield({super.key, required this.hintext, this.controller});

  final String hintext;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          hintText: hintext,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
