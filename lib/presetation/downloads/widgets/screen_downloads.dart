import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presetation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widget = [Section1(), Section2(), Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: AppBarWidget(title: "Downloads")),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) => _widget[index],
            separatorBuilder: (context, index) => SizedBox(
                  height: 25,
                ),
            itemCount: _widget.length));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: whiteColor,
        ),
        kwidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadImageNetwork extends StatelessWidget {
  const DownloadImageNetwork(
      {Key? key, required this.imageList, required this.margin, this.angle = 0})
      : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        height: size.width * 0.6,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kBlack,
            image: DecorationImage(
                image: NetworkImage(imageList), fit: BoxFit.cover)),
      ),
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SmartDownloads();
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Indroducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          "We will downloads a personlised selection of movies and shows for you there is always something to watch on your \ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(builder: (context, state) {
          log(state.dowloads.length);
          print(state.dowloads.length);

          return state.isloading || state.dowloads.isEmpty
              ? CircularProgressIndicator()
              : SizedBox(
                  width: size.width,
                  height: size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        radius: size.width * 0.35,
                      ),
                      DownloadImageNetwork(
                        imageList:
                            "$imageAppendaaUrl${state.dowloads[0].posterPath}",
                        margin: const EdgeInsets.only(left: 130, bottom: 20),
                        angle: 20,
                      ),
                      DownloadImageNetwork(
                        imageList:
                            "$imageAppendaaUrl${state.dowloads[1].posterPath}",
                        margin: const EdgeInsets.only(right: 130, bottom: 20),
                        angle: -20,
                      ),
                      DownloadImageNetwork(
                          imageList:
                              "$imageAppendaaUrl${state.dowloads[2].posterPath}",
                          margin: const EdgeInsets.only(left: 0))
                    ],
                  ),
                );
        }),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: buttonColorBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 13),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: buttonColorwhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 13),
            child: Text(
              "See what you can downloads",
              style: TextStyle(
                  color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
