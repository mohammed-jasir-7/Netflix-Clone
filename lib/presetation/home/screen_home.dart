import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presetation/home/widgets/background_card.dart';

import 'package:netflix/presetation/widgets/main_title_card.dart';

import 'widgets/custom_button_widget.dart';
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
                children: [
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
                      color: Colors.black.withOpacity(0.3),
                      width: double.infinity,
                      height: 80,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
                                width: 60,
                                height: 60,
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
