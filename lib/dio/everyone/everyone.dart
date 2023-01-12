import 'package:json_annotation/json_annotation.dart';

import 'dates.dart';
import 'result.dart';

part 'everyone.g.dart';

@JsonSerializable()
class Everyone {
  int? page;
  List<Result>? results;
  Dates? dates;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  Everyone({
    this.page,
    this.results,
    this.dates,
    this.totalPages,
    this.totalResults,
  });

  factory Everyone.fromJson(Map<String, dynamic> json) {
    return _$EveryoneFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EveryoneToJson(this);
}
