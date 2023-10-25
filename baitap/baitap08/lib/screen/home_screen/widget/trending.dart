import 'package:baitap08/config/size_config.dart';
import 'package:baitap08/config/widget/item.dart';
import 'package:baitap08/model/movie.dart';
import 'package:flutter/material.dart';

class TrendingWidget extends StatelessWidget {
  TrendingWidget({required this.movie, super.key});
  List<Movie>? movie;
  @override
  Widget build(BuildContext context) {
    List<String> image = [
      "assets/img/home/1.png",
      "assets/img/home/2.png",
      "assets/img/home/3.png",
      "assets/img/home/4.png",
      "assets/img/home/5.png"
    ];
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              SizedBox(
                height: getHeight(context, height: 0.35),
                child: Item(
                  id: movie![index].id,
                  image:
                      "https://image.tmdb.org/t/p/w500/${movie?[index].posterPath}",
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Image(
                    image: AssetImage(image[index]),
                  )),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return spaceWidth(context);
        },
        itemCount: 5);
  }
}
