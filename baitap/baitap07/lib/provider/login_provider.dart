import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLogin = false;

  void isLog() {
    isLogin = true;
    print(isLogin);
    notifyListeners();
  }
}
