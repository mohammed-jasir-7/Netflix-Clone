part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isloading,
    required List<Downloads> dowloads,
    required Option<Either<MainFailure, List<Downloads>>>
        downloadsFailureOrSuccessOption,
  }) = _DownloadsState;
  factory DownloadsState.init() {
    return const DownloadsState(
        dowloads: [],
        isloading: false,
        downloadsFailureOrSuccessOption: None());
  }
}
