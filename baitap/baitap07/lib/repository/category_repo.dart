import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:baitap07/model/category.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getCategory() async {
    const url =
        "http://apiforlearning.zendvn.com/api/categories_news?offset=2&limit=10&sort_by=id&sort_dir=asc";
    final uri = Uri.parse(url);
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
    });
    List listData = jsonDecode(response.body);
    List<CategoryModel> result = List<CategoryModel>.from(listData
        .map(
          (e) => CategoryModel.fromJson(jsonEncode(e)),
        )
        .toList());
    return result;
  }
}
