import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/network/movie_api.dart';

import 'impl/movie_remote_datasource_impl.dart';

abstract class MovieRemoteDatasource {
  factory MovieRemoteDatasource(MovieApi movieApi) =>
      MovieRemoteDatasourceImpl(movieApi: movieApi);

  Future<List<Movie>> getNowPlayingMovies();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();

  Future<List<Movie>> getUpcomingMovies();
}
