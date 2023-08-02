import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChanger(
      BuildContext context, FocusNode current, FocusNode nextScope) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextScope);
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.black,
      fontSize: 16.0,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.amber, content: Text(message)));
  }
}
