import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflix/dio/comingvideo/comingvideo.dart';

import '../comingsoon/comingsoon.dart';
import '../comingsoon/result.dart';

ValueNotifier<List<Result>> listOfComing = ValueNotifier([]);

Future<void> comingSoonGet() async {
  // final ff = {"value": 8.5};
  // final res = await Dio().post(
  //   "https://api.themoviedb.org/3/movie/315162/rating?api_key=13e0df5673afe9c8138d5df82488505e&guest_session_id=946464fa61c35f0e60404fd35cb23bec",
  // );
  // print("apiiiiiiiiiiiiiiiiiiiii${res.data}");
  try {
    var reponse = await Dio().get(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=13e0df5673afe9c8138d5df82488505e&language=en-US&page=1");
    final result = Comingsoon.fromJson(reponse.data);
    print(result.results!.first.backdropPath);

    listOfComing.value = result.results ?? [];
    listOfComing.notifyListeners();
  } catch (e) {}
}

Future<String?> videokeyword(int id) async {
  print(id);
  var response = await Dio().get(
      "https://api.themoviedb.org/3/movie/$id/videos?api_key=13e0df5673afe9c8138d5df82488505e&language=en-US");
  final res = Comingvideo.fromJson(response.data);
  if (res.results != null) {
    for (var element in res.results!) {
      if (element.type == 'Trailer') {
        return element.key!;
      } else if (element.type == 'Teaser') {
        return element.key!;
      } else {
        print(element.name);
        log(element.name ?? "no name");
        return element.key!;
      }
    }
  } else {
    return null;
  }
}
