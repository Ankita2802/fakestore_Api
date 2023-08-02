import 'package:ecommerce/repositry/fantasty_reposiry.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FantastyProvider with ChangeNotifier {
  var message;
  FantastyApiRepository fantastyApiRepository = FantastyApiRepository();
  bool _isLoading = false;
  bool get isloading => _isLoading;

  void setloading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> shareprefrence(String email, String mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('mobile', mobile);
  }

  String? ema;
  String? phone;
  Future<void> shareprefrenceget(ema, phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.get('email');
    prefs.get('mobile');
  }

  void clearData() {
    notifyListeners();
  }

  Future<bool> postRegister(
    String email,
    String mobile,
  ) async {
    try {
      Map<String, dynamic> request = {
        "email": email,
        "mobile": mobile,
      };
      setloading(true);
      final responseData =
          await fantastyApiRepository.postRegistetrAPi(request);
      developer.log(request.toString());
      if (responseData['status_code'] == 200 ||
          responseData['status_code'] == 201) {
        setloading(false);
        developer.log(responseData.toString(), name: '======------');
        Fluttertoast.showToast(
          msg: 'Register Succesfully',
          backgroundColor: Colors.grey,
        );
        String email = responseData["data"]["email"];
        String mobile = responseData["data"]["mobile"];
        await shareprefrence(email, mobile);

        return true;
      } else {
        setloading(true);
        Fluttertoast.showToast(
          msg: 'something went wrong',
          backgroundColor: Colors.grey,
        );
        developer.log(responseData.toString(), name: '======------');
      }
    } catch (e) {
      developer.log("$e", name: " postProduct");
    }
    return false;
  }

  // Future<bool> postRegisterOtp(
  //   String mobileotp,
  //   String emailotp
  // ) async {
  //   try {
  //     Map<String, dynamic> request = {
  //       "email_otp_id": ema,
  //       "mobile_otp_id": phone,
  //       "mobile_otp": mobileotp,
  //       "email_otp": emailotp,
  //       "name": "User C",
  //       "dob": "02/10/2000",
  //       "gender": "M",
  //       "address": "abc-abcd,abdy",
  //       "pin_code": "382345",
  //       "team_name": "abcd"
  //     };
  //     setloading(true);
  //     final responseData =
  //         await fantastyApiRepository.postRegistetrOtp(request);
  //     developer.log(request.toString());
  //     if (responseData['status_code'] == 200 ||
  //         responseData['status_code'] == 201) {
  //       setloading(false);
  //       message = responseData['message'];
  //       developer.log(responseData.toString(), name: '======------');
  //       Fluttertoast.showToast(
  //         msg: message,
  //         backgroundColor: Colors.grey,
  //       );

  //       return true;
  //     } else {
  //       setloading(true);
  //       Fluttertoast.showToast(
  //         msg: 'something went wrong',
  //         backgroundColor: Colors.grey,
  //       );
  //       developer.log(responseData.toString(), name: '======------');
  //     }
  //   } catch (e) {
  //     developer.log("$e", name: " postProduct");
  //   }
  //   return false;
  // }
}
