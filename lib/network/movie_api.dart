import 'package:flutter_movie_app/network/fake_movie_api.dart';
import 'package:flutter_movie_app/network/tmdb_api.dart';

import 'response/response.dart';

abstract class MovieApi {
  factory MovieApi() => TmdbApi();

  Future<MovieListResponse> getNowPlayingMovies();

  Future<MovieListResponse> getPopularMovies();

  Future<MovieListResponse> getTopRatedMovies();

  Future<MovieListResponse> getUpcomingMovies();

  Future<TvShowListResponse> getPopularTvShows();

  Future<PersonListResponse> getPopularPeople();

  Future<MovieDetailsResponse> getMovieDetails(String movieId);

  Future<MovieCreditsResponse> getMovieCredits(String movieId);
}
