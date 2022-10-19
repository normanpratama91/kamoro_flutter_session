import 'package:json_annotation/json_annotation.dart';
import 'package:kamoro_flutter_session/models/api_data.dart';

part 'list_api_data.g.dart';

@JsonSerializable(explicitToJson: true)
class ListApiData {
  List<ApiData> entries;
  int count;

  ListApiData({required this.entries, required this.count});

  factory ListApiData.fromJson(Map<String, dynamic> json) {
    return _$ListApiDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ListApiDataToJson(this);
  }
}
