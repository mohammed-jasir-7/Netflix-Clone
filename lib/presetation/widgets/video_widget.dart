import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "https://www.themoviedb.org/t/p/w250_and_h141_face/Aa9TLpNpBMyRkD8sPJ7ACKLjt0l.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              radius: 20,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.volume_off))),
        ),
      ],
    );
  }
}
