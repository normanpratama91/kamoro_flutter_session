// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_api_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListApiData _$ListApiDataFromJson(Map<String, dynamic> json) => ListApiData(
      entries: (json['entries'] as List<dynamic>)
          .map((e) => ApiData.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
    );

Map<String, dynamic> _$ListApiDataToJson(ListApiData instance) =>
    <String, dynamic>{
      'entries': instance.entries.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
