import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce/components/app_urls.dart';
import 'package:http/http.dart' as http;

class BaseRepository {
  /// For GET request
  Future<http.Response> getHttp({
    required String api,
  }) async {
    final url = AppUrl.baseposturl + api;
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
  }) async {
    final url = AppUrl.baseposturl + api;
    log(url, name: 'postHttp');
    log(data.toString(), name: '$api data');
    log(json.encode(data).toString(), name: "encode data post http");

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    log(response.statusCode.toString());

    return response;
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
