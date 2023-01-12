import 'package:flutter/material.dart';
import 'package:netflix/core/strings.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    required this.image,
    Key? key,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 270,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("$imageAppendaaUrl$image"))),
    );
  }
}
