import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.init()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(
        state.copyWith(
            isloading: true, downloadsFailureOrSuccessOption: none()),
      );
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImage();
      log(downloadsOption.toString());
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
              isloading: false,
              downloadsFailureOrSuccessOption: some(left(failure))),
          (success) => state.copyWith(
              isloading: false,
              dowloads: success,
              downloadsFailureOrSuccessOption: some(
                right(success),
              )),
        ),
      );
    });
  }
}
