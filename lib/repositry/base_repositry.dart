import 'dart:developer';
import 'package:ecommerce/components/app_urls.dart';
import 'package:http/http.dart' as http;

class BaseRepository {
  /// For GET request
  Future<http.Response> getHttp({
    required String api,
  }) async {
    final url = AppUrl.baseurl + api;
    log(url, name: 'getHttp');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    log(response.statusCode.toString());
    return response;
  }
}
