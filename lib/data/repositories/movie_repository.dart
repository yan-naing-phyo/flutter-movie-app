import 'package:flutter_movie_app/data/models/movie.dart';
import 'package:flutter_movie_app/data/remote/movie_remote_datasource.dart';

import 'impl/movie_repository_impl.dart';

abstract class MovieRepository {
  factory MovieRepository(MovieRemoteDatasource remoteDatasource) =>
      MovieRepositoryImpl(movieRemoteDatasource: remoteDatasource);

  Future<List<Movie>> getNowPlayingMovies();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();

  Future<List<Movie>> getUpcomingMovies();
}
