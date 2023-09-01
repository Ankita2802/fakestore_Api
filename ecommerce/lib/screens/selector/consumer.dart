import 'package:flutter/material.dart';

class NumberProvider with ChangeNotifier {
  int sum1 = 0;
  int sum2 = 1;
  int get number1 => sum1;
  int get number2 => sum2;

  void add() {
    sum1++;
    sum2++;
    notifyListeners();
  }

  void addtoone() {
    sum1++;
    notifyListeners();
  }

  void addtotwo() {
    sum2++;
    notifyListeners();
  }
}
