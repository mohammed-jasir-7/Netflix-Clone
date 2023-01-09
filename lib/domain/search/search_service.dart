import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';

import 'model/search_response/search_response/search_response.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResponse>> searchmovies(
      {required String moviequery});
}
