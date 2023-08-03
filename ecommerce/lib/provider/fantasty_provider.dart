import 'package:ecommerce/components/app_sharepre.dart';
import 'package:ecommerce/repositry/fantasty_reposiry.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:fluttertoast/fluttertoast.dart';

List<String> genderList = ['F', 'M', 'O'];

class FantastyProvider with ChangeNotifier {
  FantastyApiRepository fantastyApiRepository = FantastyApiRepository();

  String emailid = "";
  String get email => emailid;
  set email(String newemail) => emailid = newemail;

  String mobileid = "";
  String get mobile => mobileid;
  set mobile(String newphone) => mobileid = newphone;

  String username = "";
  String get name => username;
  set name(String newname) => username = newname;

  String dob = "";
  String get dateofb => dob;
  set dateofb(String newdob) => dob = dateofb;

  String _selectedGender = genderList[0];

  String get selectedGender => _selectedGender;

  void setSelectedGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  String address = "";
  String get addr => address;
  set addr(String newadd) => address = newadd;

  String pincode = "";
  String get pin => pincode;
  set pin(String newpin) => pincode = newpin;

  String city = "";
  String get citys => city;
  set citys(String newcity) => city = newcity;

  String state = "";
  String get states => state;
  set states(String newstate) => state = newstate;

  String country = "";
  String get countrys => country;
  set countrys(String newcountry) => country = newcountry;

  String refrecode = "";
  String get refcode => refrecode;
  set refcode(String newrefc) => refrecode = newrefc;

  String teamname = "";
  String get teamn => teamname;
  set teamn(String newteam) => teamname = newteam;

  String mobiemaillotp = "";
  String get mobemaotp => mobiemaillotp;
  set mobemaotp(String newotp) => mobiemaillotp = newotp;

  String logemamob = "";
  String get loginmobeem => logemamob;
  set loginmobeem(String newvarible) => logemamob = newvarible;

  bool _isLoading = false;
  bool get isloading => _isLoading;

  void setloading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? emailotpid;
  String? mobileotpid;

  Future<bool> postRegister() async {
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
        emailotpid = responseData['data']['email_id'];
        mobileotpid = responseData['data']['mobile_id'];
        notifyListeners();
        Fluttertoast.showToast(
          msg: 'Register Succesfully',
          backgroundColor: Colors.grey,
        );

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

  Future<bool> otpverifications() async {
    try {
      Map<String, dynamic> request = {
        "email_otp_id": emailotpid,
        "mobile_otp_id": mobileotpid,
        "mobile_otp": mobemaotp,
        "email_otp": mobemaotp,
        "name": name,
        "dob": dateofb,
        "gender": _selectedGender,
        "address": addr,
        "pin_code": pin,
        "team_name": teamn
      };
      setloading(true);
      final responseData =
          await fantastyApiRepository.postRegistetrOtp(request);
      developer.log(request.toString());
      if (responseData['status_code'] == 200 ||
          responseData['status_code'] == 201) {
        developer.log(responseData.toString(), name: '======------');
        String accessToken = responseData["data"]["access_token"];
        String refreshToken = responseData["data"]["refresh_token"];
        String userId = responseData['data']["user_id"];
        String message = responseData['message'];
        MySharedPreferences.instance
            .setStringValue("access_token", accessToken);
        MySharedPreferences.instance
            .setStringValue("refresh_token", refreshToken);
        MySharedPreferences.instance.setStringValue("userid", userId);

        Fluttertoast.showToast(
          msg: message,
          backgroundColor: Colors.grey,
        );
        notifyListeners();
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

  Future<bool> logoin() async {
    try {
      Map<String, dynamic> request = {
        "variable": loginmobeem,
      };
      setloading(true);
      final responseData = await fantastyApiRepository.postLogin(request);
      developer.log(request.toString());
      if (responseData['status_code'] == 200 ||
          responseData['status_code'] == 201) {
        setloading(false);
        developer.log(responseData.toString(), name: '======------');
        String message = responseData['message'];
        notifyListeners();
        Fluttertoast.showToast(
          msg: message,
          backgroundColor: Colors.grey,
        );

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
      developer.log("$e", name: " postlogin");
    }
    return false;
  }
}
