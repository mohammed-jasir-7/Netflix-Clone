import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 30,
              height: 150,
            ),
            Container(
              width: 140,
              height: 270,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mkRQn520JQD07BNP03NK3iKCaPD.jpg"))),
            ),
          ],
        ),
        Positioned(
          left: 0,
          bottom: 10,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 1.3,
            child: Text("${index + 1}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 120,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.red)),
          ),
        )
      ],
    );
  }
}
