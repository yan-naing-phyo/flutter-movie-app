import 'dart:convert';

import 'package:flutter/services.dart';
import 'response/response.dart';
import 'movie_api.dart';

class FakeMovieApi implements MovieApi {
  @override
  Future<MovieListResponse> getNowPlayingMovies() {
    return _loadMovies();
  }

  @override
  Future<MovieListResponse> getPopularMovies() {
    return _loadMovies();
  }

  @override
  Future<MovieListResponse> getTopRatedMovies() {
    return _loadMovies();
  }

  @override
  Future<MovieListResponse> getUpcomingMovies() {
    return _loadMovies();
  }

  @override
  Future<TvShowListResponse> getPopularTvShows() async {
    final json =
        await rootBundle.loadString('assets/popular_tv_shows_response.json');

    return TvShowListResponse.fromJson(jsonDecode(json));
  }

  Future<MovieListResponse> _loadMovies() async {
    final json =
        await rootBundle.loadString('assets/popular_movies_response.json');

    return MovieListResponse.fromJson(jsonDecode(json));
  }
  
  @override
  Future<PersonListResponse> getPopularPeople() {
    // TODO: implement getPopularPeople
    throw UnimplementedError();
  }
}
