import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/strings.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  final String image;

  const VideoListItem({super.key, required this.index, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // color: Colors.accents[index % Colors.accents.length],
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("$imageAppendaaUrl$image"))),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 20,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.volume_off))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/dIi0De3LzEVSQHEUlh0Q2zUpmeW.jpg"),
                      ),
                    ),
                    VideoActionWidget(icon: Icons.emoji_emotions, title: "LOL"),
                    VideoActionWidget(icon: Icons.add, title: "My List"),
                    VideoActionWidget(icon: Icons.share, title: "Share"),
                    VideoActionWidget(icon: Icons.play_arrow, title: "Play"),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: const TextStyle(color: whiteColor),
          )
        ],
      ),
    );
  }
}
