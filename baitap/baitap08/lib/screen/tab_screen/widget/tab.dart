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
    List build = [
      context.read<MovieProvider>().getMoviesNowPlaying(),
      context.read<MovieProvider>().getMoviesUpComing(),
      context.read<MovieProvider>().getMoviesTopRated(),
      context.read<MovieProvider>().getMoviesPopular()
    ];
    return FutureBuilder(
        future: build[indexTab],
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No Data"),
            );
          } else {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Movie>? movie = snapshot.data as List<Movie>?;

              return Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Item(
                      image: movie[index].posterPath,
                      id: movie[index].id,
                    );
                  },
                  itemCount: movie!.length,
                ),
              );
            }
          }
        });
  }
}
