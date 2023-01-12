import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/dio/fast_laugh_function.dart';
import 'package:netflix/dio/new_and-hot/everyone_watchiching.dart';

import '../../core/constants.dart';
import '../../dio/new_and-hot/function_new_and_hot.dart';
import 'widgets/coming_soon_widget.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const Icon(
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
          title: const Text(
            "New & Hot",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              unselectedLabelColor: whiteColor,
              labelColor: kBlack,
              labelStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              splashBorderRadius: kfinalRadious,
              indicator:
                  BoxDecoration(color: whiteColor, borderRadius: kfinalRadious),
              tabs: const [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's watching",
                )
              ]),
        ),
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveryonsWatching(),
        ]),
      ),
    );
  }

  _buildComingSoon() {
    comingSoonGet();
    return ValueListenableBuilder(
      valueListenable: listOfComing,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: listOfComing.value.length,
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              ComingSoonWidget(result: value[index]),
        );
      },
    );
  }

  _buildEveryonsWatching() {
    everyOneWatch();
    return ValueListenableBuilder(
      valueListenable: everyOne,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: everyOne.value.length,
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              EveryonesWatchingWidget(result: value[index]),
        );
      },
    );
  }
}
