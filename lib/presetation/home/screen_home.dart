import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/dio/new_and-hot/function_new_and_hot.dart';
import 'package:netflix/presetation/home/widgets/background_card.dart';

import 'package:netflix/presetation/widgets/main_title_card.dart';

import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundCard(),
                  MainTItleCard(title: "Released in the past year"),
                  MainTItleCard(
                    title: "Trending Now",
                  ),
                  NumberTitleCard(),
                  MainTItleCard(title: "Tense Dramas"),
                  MainTItleCard(title: "South Indian Cinema"),
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: Duration(seconds: 3),
                      width: double.infinity,
                      height: 80,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              kwidth,
                              Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0RkG8KYe9kH1xO60rxolcOiPE7IU8t45Ouw&usqp=CAU",
                                width: 40,
                                height: 40,
                              ),
                              Spacer(),
                              Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 26,
                              ),
                              kwidth,
                              Container(
                                width: 26,
                                height: 26,
                                color: Colors.blue,
                              ),
                              kwidth,
                            ],
                          ),
                          // next line
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Tv Shows"),
                              Text("Movies"),
                              Text("Categories"),
                            ],
                          )
                        ],
                      ),
                    )
                  : kheight
            ],
          ),
        );
      },
    ));
  }
}
