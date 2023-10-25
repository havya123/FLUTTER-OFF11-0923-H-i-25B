import 'package:baitap07/model/category_news.dart';
import 'package:baitap07/repository/cate_news_repo.dart';
import 'package:flutter/material.dart';

class CateNewsProvider extends ChangeNotifier {
  List responses = [];

  Future<List<CategoryNews>> getCategory(int? id) async {
    print(id);
    List<CategoryNews> response = await CateNewsRepo().getCategoryNews(id!);
    responses.add(response);
    return response;
  }
}
