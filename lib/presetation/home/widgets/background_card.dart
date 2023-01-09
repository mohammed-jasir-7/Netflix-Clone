import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/colors/colors.dart';
import 'custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gZleGu1MQVBArH2dlpZ9CGi0hhy.jpg"))),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(icon: Icons.add, title: "My List"),
              _playButton(),
              CustomButton(icon: Icons.info, title: "Info"),
            ],
          ),
        )
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(whiteColor)),
    onPressed: () {},
    icon: Icon(
      Icons.play_arrow,
      size: 20,
      color: kBlack,
    ),
    label: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Play",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
