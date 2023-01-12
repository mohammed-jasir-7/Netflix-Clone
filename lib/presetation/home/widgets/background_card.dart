import 'package:flutter/material.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/dio/new_and-hot/function_new_and_hot.dart';

import '../../../core/colors/colors.dart';
import 'custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: listOfComing,
          builder: (context, value, child) {
            return Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 500),
              decoration: const BoxDecoration(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  value.isEmpty
                      ? CircularProgressIndicator()
                      : Image.network(
                          "$imageAppendaaUrl${value[5].posterPath}",
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.noRepeat,
                          height: 600,
                        ),
                  Container(
                    height: 600,
                    width: 500,
                    decoration: const BoxDecoration(
                        gradient: RadialGradient(
                            radius: 0.8,
                            focalRadius: 0.0,
                            colors: [Colors.transparent, Colors.black])),
                  )
                ],
              ),
            );
          },
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButton(icon: Icons.add, title: "My List"),
              _playButton(),
              const CustomButton(icon: Icons.info, title: "Info"),
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
    icon: const Icon(
      Icons.play_arrow,
      size: 20,
      color: kBlack,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Play",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
