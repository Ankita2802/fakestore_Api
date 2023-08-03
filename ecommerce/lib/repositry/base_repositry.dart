import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce/components/app_sharepre.dart';
import 'package:ecommerce/components/app_urls.dart';
import 'package:http/http.dart' as http;

class BaseRepository {
  /// For GET request
  Future<http.Response> getHttp({
    required String api,
  }) async {
    final url = AppUrl.baseUrl + api;
    log(url, name: 'getHttp');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    log(response.statusCode.toString());

    return response;
  }

  Future<http.Response> postHttp({
    required Map<String, dynamic> data,
    required String api,
    bool token = false,
  }) async {
    String? accessToken;
    final url = AppUrl.baseUrl + api;
    log(url, name: 'postHttp');
    log(data.toString(), name: '$api data');
    if (token) {
      accessToken =
          await MySharedPreferences.instance.getStringValue("access_token");
      log(accessToken.toString(), name: "access_token");
    }
    log(json.encode(data).toString(), name: "encode data post http");
    final response = await http.post(
      Uri.parse(url),
      headers: accessToken == null
          ? {'Content-Type': 'application/json'}
          : {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $accessToken'
            },
      body: json.encode(data),
    );
    log(response.statusCode.toString());
    if (response.statusCode == 403 && token) {
      return refreshToken()
          .then((value) => postHttp(data: data, api: api, token: token));
    }
    return response;
  }

  Future<void> refreshToken() async {
    String? refreshToken =
        await MySharedPreferences.instance.getStringValue("refresh_token");
    final url = AppUrl.baseUrl + refreshToken.toString();
    log(refreshToken.toString(), name: 'refreshToken');

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $refreshToken'
      },
    );
    log(response.body, name: 'response refreshToken');
    String accessToken = json.decode(response.body)['data'];
    MySharedPreferences.instance.setStringValue("access_token", accessToken);
  }

  Future<http.Response> putHttp({
    required Map<String, dynamic> data,
    required String api,
  }) async {
    final url = AppUrl.baseposturl + api;
    log(url, name: 'putHttp');
    log(data.toString(), name: '$api data');
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    log(response.statusCode.toString());
    return response;
  }
}
