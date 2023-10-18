import 'package:baitap07/app/shared_preferences/key.dart';
import 'package:baitap07/app/shared_preferences/shared_preferences.dart';
import 'package:baitap07/model/category.dart';
import 'package:baitap07/repository/category_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryProvider extends ChangeNotifier {
  SharedPreferences? prefs;
  List listId = [];
  SharedCategory sharedCategory = SharedCategory();

  Future<List<CategoryModel>> getCategory() async {
    List<CategoryModel> response = await CategoryRepository().getCategory();
    return response;
  }

  void saveCheckBox(int id) async {
    if (listId.contains(id)) {
      listId.remove(id);
    } else {
      listId.add(id);
    }
    sharedCategory.saveShared(keyCategory, listId);
    notifyListeners();
  }

  Future<void> loadData() async {
    List data = await sharedCategory.getShared(keyCategory);
    listId = data;
    notifyListeners();
  }
}
