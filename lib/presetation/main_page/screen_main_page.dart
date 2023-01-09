import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presetation/downloads/widgets/screen_downloads.dart';
import 'package:netflix/presetation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/presetation/home/screen_home.dart';
import 'package:netflix/presetation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presetation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presetation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexnotifier,
          builder: (context, index, child) => _pages[index],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
