import 'package:flutter_movie_app/data/models/models.dart';
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

  @override
  Future<MovieDetails> getMovieDetails(String movieId) {
    return movieRemoteDatasource.getMovieDetails(movieId);
  }

  @override
  Future<List<Cast>> getMovieCasts(String movieId) {
    return movieRemoteDatasource.getMovieCasts(movieId);
  }
}
