import 'package:baitap08/model/movie.dart';
import 'package:baitap08/repository/movie_repo.dart';
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  Future<List<Movie>> getMoviesTopRated() async {
    var response = await MovieRepo().getMoviesPopular("top_rated");
    return response;
  }

  Future<List<Movie>> getMoviesUpComing() async {
    var response = await MovieRepo().getMoviesPopular("upcoming");
    return response;
  }

  Future<List<Movie>> getMoviesPopular() async {
    var response = await MovieRepo().getMoviesPopular("popular");
    return response;
  }

  Future<List<Movie>> getMoviesNowPlaying() async {
    var response = await MovieRepo().getMoviesPopular("now_playing");
    return response;
  }

  Future<Movie?> getMovieDetail(int? id) async {
    if (id != null) {
      var response = await MovieRepo().getMovieDetail(id);
      return response;
    }
    return null;
  }
}
