import 'dart:convert';
import 'dart:io';

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

  Future? post(String url, dynamic jsonRequestBody,
      {Map<String, String>? headers}) async {
    Uri uri = Uri.parse(url);
    // final headers = {'Authorization': 'Bearer asdf', 'Accept-version': '1.0.0'};

    print(jsonRequestBody);

    try {
      final response = await http.post(uri,
          headers: {"Content-type": "application/json"},
          body: jsonEncode(jsonRequestBody));
      print(response.statusCode);

      if (response.statusCode == 200) {
        final res = response.body;

        return res;
      } else {
        return null;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future? put() {}

  Future? delete() {}

  Future<Map<String, String>> _getHttpHeaders() async {
    final headers = <String, String>{};

    // if (token != null) {
    //   headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    // }

    headers[HttpHeaders.contentTypeHeader] = 'application/json';

    return headers;
  }
}
