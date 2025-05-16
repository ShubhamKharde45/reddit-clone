import 'package:flutter/material.dart';

class Infobartext extends StatelessWidget {
  const Infobartext({required this.text, required this.text2});

  final String text2;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              color: Colors.grey.shade200,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
