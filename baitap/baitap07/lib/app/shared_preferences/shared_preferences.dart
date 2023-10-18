import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedCategory {
  SharedPreferences? _sharedPreferences;
  Future<void> saveShared(String categoryKey, List data) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences?.setString(categoryKey, jsonEncode(data));
  }

  Future<List<int>> getShared(String categoryKey) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    String action = _sharedPreferences?.getString(categoryKey) ?? "[]";
    List<int> data = List<int>.from(jsonDecode(action));
    return data;
  }
}
