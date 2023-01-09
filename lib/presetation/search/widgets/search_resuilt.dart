import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presetation/search/widgets/title.dart';

class SearchTitleWidget extends StatelessWidget {
  const SearchTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: "movies & Tv"),
        kheight,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return state.searchResultdata.isEmpty
                ? Text("no data found")
                : GridView.count(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.4,
                    shrinkWrap: true,
                    children: List.generate(
                        state.searchResultdata.length,
                        (index) => MainCard(
                              imageUrl:
                                  '$imageAppendaaUrl${state.searchResultdata[index].posterPath}',
                            )),
                  );
          },
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}
