import 'package:baitap08/model/movie.dart';
import 'package:baitap08/repository/movie_repo.dart';
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> topRatedMovies = [];
  List<Movie> upComingMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> nowPlayongMovies = [];

  Future<void> getMoviesTopRated() async {
    topRatedMovies = await MovieRepo().getMoviesPopular("top_rated");
    notifyListeners();
  }

  Future<void> getMoviesUpComing() async {
    upComingMovies = await MovieRepo().getMoviesPopular("upcoming");

    notifyListeners();
  }

  Future<void> getMoviesPopular() async {
    popularMovies = await MovieRepo().getMoviesPopular("popular");
    notifyListeners();
  }

  Future<void> getMoviesNowPlaying() async {
    nowPlayongMovies = await MovieRepo().getMoviesPopular("now_playing");

    notifyListeners();
  }

  Future<Movie?> getMovieDetail(int? id) async {
    if (id != null) {
      var response = await MovieRepo().getMovieDetail(id);
      return response;
    }
    return null;
  }
}
