import 'package:flutter/material.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/dio/new_and-hot/function_new_and_hot.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key, required this.imageurl, required this.id})
      : super(key: key);
  final String imageurl;
  final int id;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  bool isMute = false;
  late YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: "",
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.red,
          child: YoutubePlayer(
            thumbnail: Image.network("$imageAppendaaUrl${widget.imageurl}"),
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () async {
              final keyword = await videokeyword(widget.id);

              setState(() {
                _controller.load(keyword ?? "");
                _controller.pause();
              });
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              radius: 20,
              child: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.volume_off))),
        ),
      ],
    );
  }
}
