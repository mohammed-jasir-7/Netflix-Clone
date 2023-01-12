import 'package:flutter/material.dart';
import 'package:netflix/dio/comingsoon/result.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({Key? key, required this.result}) : super(key: key);

  final Result result;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Text("FEB",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              Text(
                result.releaseDate!.substring(8, 10),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          width: size.width - 50,
          constraints: BoxConstraints(minHeight: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                imageurl: result.backdropPath ?? "n",
                id: result.id ?? 0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      result.title ?? "no title",
                      style: TextStyle(
                          letterSpacing: -2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
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
              Text(
                result.originalTitle ?? "",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              kheight,
              SizedBox(
                width: 300,
                child: Text(
                  result.overview ?? "",
                  style: TextStyle(
                    color: kgrey,
                    fontSize: 13,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
