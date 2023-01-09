import 'package:flutter/material.dart';

import '../../core/constants.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainTItleCard extends StatelessWidget {
  const MainTItleCard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          kheight,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: MainCard(),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
