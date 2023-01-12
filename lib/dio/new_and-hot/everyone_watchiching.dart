import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflix/dio/everyone/everyone.dart';
import 'package:netflix/dio/everyone/result.dart';

ValueNotifier<List<Result>> everyOne = ValueNotifier([]);

Future<void> everyOneWatch() async {
  try {
    var reponse = await Dio().get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=13e0df5673afe9c8138d5df82488505e&language=en-US&page=1");
    final result = Everyone.fromJson(reponse.data);
    print(result.results!.first.backdropPath);

    everyOne.value = result.results ?? [];
    everyOne.notifyListeners();
  } catch (e) {}
}
