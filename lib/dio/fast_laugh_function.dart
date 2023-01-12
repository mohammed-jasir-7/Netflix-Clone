import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:netflix/dio/fastlaugh/fastlaugh.dart';
import 'package:netflix/dio/fastlaugh/result.dart';

ValueNotifier<List<Result>> fastlagh = ValueNotifier([]);

Future<void> fastlaghhtp() async {
  try {
    var response = await Dio().get(
        'https://api.themoviedb.org/3/trending/tv/day?api_key=13e0df5673afe9c8138d5df82488505e');
    final fast = Fastlaugh.fromJson(response.data);

    fastlagh.value = fast.results ?? [];
    fastlagh.notifyListeners();
  } catch (e) {}
}
