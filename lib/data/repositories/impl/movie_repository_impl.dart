import 'package:flutter_movie_app/data/models/movie.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';
import 'package:flutter_movie_app/data/remote/movie_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  const MovieRepositoryImpl({required this.movieRemoteDatasource});

  final MovieRemoteDatasource movieRemoteDatasource;

  @override
  Future<List<Movie>> getNowPlayingMovies() {
    return movieRemoteDatasource.getNowPlayingMovies();
  }

  @override
  Future<List<Movie>> getPopularMovies() {
    return movieRemoteDatasource.getPopularMovies();
  }

  @override
  Future<List<Movie>> getTopRatedMovies() {
    return movieRemoteDatasource.getTopRatedMovies();
  }

  @override
  Future<List<Movie>> getUpcomingMovies() {
    return movieRemoteDatasource.getUpcomingMovies();
  }
}
