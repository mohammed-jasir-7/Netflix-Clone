import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: "Top 10 Tv Shows In India Today"),
          kheight,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => Padding(
                        padding: EdgeInsets.only(right: 0.0),
                        child: Align(
                            alignment: Alignment.topRight,
                            widthFactor: 0.95,
                            child: NumberCard(index: index)),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
