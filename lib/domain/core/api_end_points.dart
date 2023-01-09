import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "${baseurl}trending/all/day?api_key=$apiKey";
  static const search = "${baseurl}search/movie?api_key=$apiKey";
}
