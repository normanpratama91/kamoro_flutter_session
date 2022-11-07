import 'dart:convert';

import 'package:http/http.dart' as http;

class RestApi {
  Future? get(url) async {
    Uri uri = Uri.parse(url);

    final headers = {'Authorization': '', 'Accept-version': '1.0.0'};
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final res = response.body;

      return jsonDecode(res);
    } else {
      throw Exception("${response.statusCode} ${response.body}");
    }
  }

  Future? post(String url, Object jsonRequestBody) async {
    Uri uri = Uri.parse(url);
    final headers = {'Authorization': 'Bearer asdf', 'Accept-version': '1.0.0'};

    final response =
        await http.post(uri, headers: headers, body: jsonRequestBody);

    if (response.statusCode == 200) {
      final res = response.body;

      return jsonDecode(res);
    } else {
      throw Exception("${response.statusCode} ${response.body}");
    }
  }

  Future? put() {}

  Future? delete() {}
}
