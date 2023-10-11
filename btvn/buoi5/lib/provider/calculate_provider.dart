import 'dart:convert';
import 'package:buoi5/model/result_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculateProvider extends ChangeNotifier {
  TextEditingController firstNumber = TextEditingController();
  TextEditingController secNumber = TextEditingController();

  double result = 0;
  int selectedIndex = -1;
  List<ResultModel> listResults = [];

  Color defaultTextColor = Colors.black;

  void selectItem(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Color getItemTextColor(int index) {
    return index == selectedIndex ? Colors.red : defaultTextColor;
  }

  void handleCal(String cal) {
    double num1 = double.parse(firstNumber.text);
    double num2 = double.parse(secNumber.text);
    switch (cal) {
      case "+":
        result = num1 + num2;
      case "-":
        result = num1 - num2;
      case "%":
        result = num1 / num2;
      case "X":
        result = num1 * num2;
      default:
        result;
    }
    listResults.add(ResultModel(result: result.toString()));
    saveListResult();
    resetForm();
    notifyListeners();
  }

  void deleteElement(int index) {
    listResults.removeAt(index);
    saveListResult();
    notifyListeners();
  }

  void resetForm() {
    firstNumber.clear();
    secNumber.clear();
    notifyListeners();
  }

  void clearAll() {
    listResults.clear();
    saveListResult();
    notifyListeners();
  }

  void saveListResult() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> resultListString =
        listResults.map((e) => jsonEncode(e.toMap())).toList();
    prefs.setStringList("result", resultListString);
  }

  void loadResult() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? resultListString = prefs.getStringList("result");
    if (resultListString != null) {
      listResults = resultListString
          .map((e) => ResultModel.fromJson(json.decode(e)))
          .toList();
    } else {
      listResults = [];
    }
    notifyListeners();
  }
}
