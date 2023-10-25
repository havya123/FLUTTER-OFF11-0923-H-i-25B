import 'package:baitap08/config/widget/item.dart';
import 'package:baitap08/model/movie.dart';
import 'package:flutter/material.dart';

class DetailTab extends StatelessWidget {
  DetailTab({required this.movie, super.key});

  Movie movie;
  @override
  Widget build(BuildContext context) {
    List<dynamic> detail = [
      movie.overView,
    ];
    return Text(
      detail[0],
      style: const TextStyle(color: Colors.white),
    );
  }
}
