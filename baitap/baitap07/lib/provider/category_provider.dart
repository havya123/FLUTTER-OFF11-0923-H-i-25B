import 'package:baitap07/model/category.dart';
import 'package:baitap07/repository/category_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> category = [];
  SharedPreferences? prefs;

  Future<void> getCategory() async {
    final response = await CategoryRepository().getCategory();
    category = response;
    notifyListeners();
  }

  void saveCheckBox(int id, bool isChecked) async {
    prefs = await SharedPreferences.getInstance();
    await prefs?.setBool("isChecked_$id", isChecked);
    notifyListeners();
  }

  void loadCheckbox() async {
    prefs = await SharedPreferences.getInstance();
  }
}
