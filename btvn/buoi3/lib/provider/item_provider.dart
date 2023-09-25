import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  int number = 0;

  void increase() {
    number++;
    notifyListeners();
  }

  void decrease() {
    number--;
    notifyListeners();
  }
}
