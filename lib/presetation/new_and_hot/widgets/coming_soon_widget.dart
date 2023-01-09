import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: const [
              Text("FEB",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              Text(
                "11",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          width: size.width - 50,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              Row(
                children: [
                  const Text(
                    "TALL GIRL 2",
                    style: TextStyle(
                        letterSpacing: -3,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButton(
                        icon: Icons.alarm_sharp,
                        title: "Remind me",
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kwidth,
                      CustomButton(
                        icon: Icons.info,
                        title: "Info",
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kwidth,
                      kwidth
                    ],
                  )
                ],
              ),
              kheight,
              const Text("Coming on friday"),
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
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
