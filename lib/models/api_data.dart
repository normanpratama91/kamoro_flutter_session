import 'package:json_annotation/json_annotation.dart';

part 'api_data.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiData {
  String? API;
  String? Description;

  ApiData({this.API, this.Description});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return _$ApiDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApiDataToJson(this);
  }
}
