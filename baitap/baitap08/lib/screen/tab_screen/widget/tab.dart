import 'package:baitap08/config/widget/item.dart';
import 'package:baitap08/model/movie.dart';
import 'package:baitap08/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabWidget extends StatelessWidget {
  TabWidget({required this.indexTab, super.key});
  int indexTab;
  @override
  Widget build(BuildContext context) {
    List<List<Movie>> movie = [
      context.read<MovieProvider>().nowPlayongMovies,
      context.read<MovieProvider>().upComingMovies,
      context.read<MovieProvider>().topRatedMovies,
      context.read<MovieProvider>().popularMovies,
    ];
    return Consumer<MovieProvider>(builder: (context, value, child) {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Item(
            image: movie[indexTab][index].posterPath,
            id: movie[indexTab][index].id,
          );
        },
        itemCount: movie[indexTab].length,
      );
    });
  }
}
