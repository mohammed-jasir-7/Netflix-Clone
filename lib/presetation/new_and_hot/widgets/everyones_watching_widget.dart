import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const Text(
          "Tall Girl 2",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
            "55555,jsbdvjsdvbsb sbv;jbdv;bd ;aB;voB vobvd ovbv;ddbv;dbvbdbvlvddbda;bvabv ",
            style: TextStyle(
              color: kgrey,
              fontSize: 13,
            )),
        const VideoWidget(),
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
