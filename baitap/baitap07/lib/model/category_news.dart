// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryNews {
  int id;
  String thumb;
  String title;
  int cateID;
  String article;
  String content;
  String description;
  CategoryNews(
      {required this.id,
      required this.thumb,
      required this.title,
      required this.cateID,
      required this.article,
      required this.content,
      required this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'thumb': thumb,
      'title': title,
      'cate_id': cateID,
      'article': article,
      'content': content,
      'description': description
    };
  }

  factory CategoryNews.fromMap(Map<String, dynamic> map) {
    return CategoryNews(
        id: map['id'] as int,
        thumb: map['thumb'] as String,
        title: map['title'] as String,
        cateID: map['category']['id'] as int,
        article: map['category']['name'] as String,
        content: map['content'] as String,
        description: map['description'] as String);
  }

  String toJson() => json.encode(toMap());

  factory CategoryNews.fromJson(String source) =>
      CategoryNews.fromMap(json.decode(source) as Map<String, dynamic>);
}
