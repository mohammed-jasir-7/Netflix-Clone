// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'everyone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Everyone _$EveryoneFromJson(Map<String, dynamic> json) => Everyone(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      dates: json['dates'] == null
          ? null
          : Dates.fromJson(json['dates'] as Map<String, dynamic>),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$EveryoneToJson(Everyone instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'dates': instance.dates,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
