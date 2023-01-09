import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presetation/search/widgets/title.dart';

import '../../../core/constants.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: "Top Search"),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              print(state.idleList);
              if (state.isLoading) {
                return CircularProgressIndicator();
              } else if (state.isError) {
                return Center(child: const Text("errror"));
              } else if (state.idleList.isEmpty) {
                return Center(
                  child: Text("Search redult is empty"),
                );
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => TopSearchItemTile(
                        title: state.idleList[index].title ?? "no title",
                        imageUrl:
                            '$imageAppendaaUrl${state.idleList[index].posterPath}'),
                    separatorBuilder: (context, index) => kheight20,
                    itemCount: state.idleList.length);
              }
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        kwidth,
        Expanded(
            child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        const CircleAvatar(
          backgroundColor: whiteColor,
          radius: 23,
          child: CircleAvatar(
            backgroundColor: kBlack,
            radius: 20,
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
