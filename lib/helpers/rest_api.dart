import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestApi {
  Future? get(url) async {
    Uri uri = Uri.parse(url);

    final shr = await SharedPreferences.getInstance();
    final token = shr.getString('token');

    final headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final res = response.body;

      print(res);
      return jsonDecode(res);
    } else {
      throw Exception("${response.statusCode} ${response.body}");
    }
  }

  Future? post(
    String url,
    dynamic jsonRequestBody,
  ) async {
    Uri uri = Uri.parse(url);
    print(jsonRequestBody);

    try {
      final shr = await SharedPreferences.getInstance();
      final token = shr.getString('token');

      final headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      };

      final response = await http.post(uri,
          headers: headers, body: jsonEncode(jsonRequestBody));
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = response.body;

        print(res);
        return res;
      } else {

        final res = response.body;

        print(res);
        return res;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future? put() {}

  Future? delete() {}
}
