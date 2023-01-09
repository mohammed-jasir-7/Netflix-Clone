import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/search/search_service.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/model/search_response/search_response/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadService;
  final SearchService _searchService;
  SearchBloc(this._downloadService, this._searchService)
      : super(SearchState.initial()) {
    //idle
    on<Initilized>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
              searchResultdata: [],
              idleList: state.idleList,
              isLoading: false,
              isError: false),
        );
        return;
      }
      emit(
        SearchState(
            searchResultdata: [],
            idleList: [],
            isLoading: true,
            isError: false),
      );

      final _result = await _downloadService.getDownloadsImage();
      final _state = _result.fold((MainFailure f) {
        return SearchState(
            searchResultdata: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultdata: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      // TODO: implement event handler
      emit(_state);
    });
    //result
    on<SearchMovie>((event, emit) async {
      emit(
        SearchState(
            searchResultdata: [],
            idleList: [],
            isLoading: true,
            isError: false),
      );
      final _result =
          await _searchService.searchmovies(moviequery: event.movieQuery);
      final _state = _result.fold((MainFailure f) {
        return SearchState(
            searchResultdata: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchResponse r) {
        return SearchState(
            searchResultdata: r.results,
            idleList: [],
            isLoading: false,
            isError: false);
      });
      emit(_state);

      // TODO: implement event handler
    });
  }
}
