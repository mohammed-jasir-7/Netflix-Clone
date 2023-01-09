import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 13})
      : super(key: key);
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;

  get whiteColor => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: textSize),
        )
      ],
    );
  }
}
