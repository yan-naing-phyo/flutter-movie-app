import 'package:flutter_movie_app/data/local/movie_local_datasource.dart';
import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';
import 'package:flutter_movie_app/data/remote/movie_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  const MovieRepositoryImpl({
    required this.movieRemoteDatasource,
    required this.movieLocalDatasource,
  });

  final MovieRemoteDatasource movieRemoteDatasource;
  final MovieLocalDatasource movieLocalDatasource;

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

  @override
  Future<void> addMovieToWatchlist(MovieDetails movie) async {
    await movieLocalDatasource.insertMovie(movie);
  }

  @override
  Stream<List<MovieDetails>> getAllMoviesFromWatchlist() {
    return movieLocalDatasource.getAllMovies();
  }

  @override
  Future<MovieDetails?> findWatchlistMovieById(String movieId) {
    return movieLocalDatasource.findMovieById(movieId);
  }

  @override
  Future<void> removeMovieFromWatchlist(String movieId) async {
    await movieLocalDatasource.deleteMovie(movieId);
  }
}
