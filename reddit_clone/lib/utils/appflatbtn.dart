import 'package:flutter/material.dart';

class Appflatbtn extends StatelessWidget {
  const Appflatbtn({super.key, required this.text, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          text,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
  }
}