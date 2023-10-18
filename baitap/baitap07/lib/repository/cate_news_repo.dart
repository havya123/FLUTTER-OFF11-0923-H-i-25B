import 'dart:convert';

import '../model/category_news.dart';
import 'package:http/http.dart' as http;

class CateNewsRepo {
  Future<List<CategoryNews>> getCategoryNews(int? id) async {
    if (id == null) {
      return [];
    } else {
      final url =
          "http://apiforlearning.zendvn.com/api/categories_news/$id/articles?offset=0&limit=10&sort_by=id&sort_dir=desc";
      final uri = Uri.parse(url);

      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': 'true',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
      });
      List listData = jsonDecode(response.body);
      List<CategoryNews> result = List<CategoryNews>.from(
          listData.map((e) => CategoryNews.fromJson(jsonEncode(e)))).toList();

      return result;
    }
  }
}
