import 'package:flutter/material.dart';
import 'package:test/const/color.dart';

class MyCircullerIndecator extends StatelessWidget {
  const MyCircullerIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
          color: buttionColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: fontWhite,
          ),
        ));
  }
}
