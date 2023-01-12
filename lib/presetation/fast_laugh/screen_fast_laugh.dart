import 'package:flutter/material.dart';
import 'package:netflix/dio/fast_laugh_function.dart';
import 'package:netflix/presetation/fast_laugh/widgets/video_list_item.dart';

import '../../core/strings.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    fastlaghhtp();
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: fastlagh,
        builder: (context, value, child) {
          return PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
                fastlagh.value.length,
                (index) => VideoListItem(
                      index: index,
                      image: value[index].posterPath ??
                          "$imageAppendaaUrl${value[index].backdropPath}",
                    )),
          );
        },
      )),
    );
  }
}
