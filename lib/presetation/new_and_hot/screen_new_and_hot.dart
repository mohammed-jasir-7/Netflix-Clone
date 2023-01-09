import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

import '../../core/constants.dart';
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
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }

  _buildEveryonsWatching() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) => const EveryonesWatchingWidget(),
    );
  }
}
