import 'package:flutter/material.dart';
import 'package:netflix/dio/everyone/result.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({Key? key, required this.result})
      : super(key: key);
  final Result result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          result.title ?? "No title",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(result.overview ?? "",
            style: TextStyle(
              color: kgrey,
              fontSize: 13,
            )),
        kheight,
        VideoWidget(imageurl: result.backdropPath ?? "k", id: result.id ?? 1),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButton(
              icon: Icons.share,
              title: "Share",
              iconSize: 30,
              textSize: 10,
            ),
            kwidth,
            CustomButton(
              icon: Icons.add,
              title: "My LIst",
              iconSize: 30,
              textSize: 10,
            ),
            kwidth,
            CustomButton(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 30,
              textSize: 10,
            ),
            kwidth,
            kwidth
          ],
        )
      ],
    );
  }
}
