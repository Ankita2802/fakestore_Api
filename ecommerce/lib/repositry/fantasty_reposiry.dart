import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce/components/app_urls.dart';
import 'package:ecommerce/repositry/base_repositry.dart';

class FantastyApiRepository extends BaseRepository {
  //post for Registerscreen
  Future postRegistetrAPi(Map<String, dynamic> data) async {
    final response =
        await postHttp(api: AppUrl.register, data: data, token: false);
    log(response.body, name: 'postRegisterAPi');
    return json.decode(response.body);
  }

  //post for registerotp screen
  Future postRegistetrOtp(Map<String, dynamic> data) async {
    final response =
        await postHttp(api: AppUrl.registerotp, data: data, token: true);
    log(response.body, name: 'postRegisterOtp');
    return json.decode(response.body);
  }

  Future postLogin(Map<String, dynamic> data) async {
    final response = await postHttp(api: AppUrl.login, data: data, token: true);
    log(response.body, name: 'postLogin');
    return json.decode(response.body);
  }

  //logi otp apo
  Future postLoginOtp(Map<String, dynamic> data) async {
    final response =
        await postHttp(api: AppUrl.loginotp, data: data, token: true);
    log(response.body, name: 'postLoginotp');
    return json.decode(response.body);
  }
}
