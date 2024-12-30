import 'package:flutter_movie_app/data/local/movie_local_datasource.dart';
import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/remote/movie_remote_datasource.dart';

import 'impl/movie_repository_impl.dart';

abstract class MovieRepository {
  factory MovieRepository(
    MovieRemoteDatasource remoteDatasource,
    MovieLocalDatasource localDatasource,
  ) =>
      MovieRepositoryImpl(
        movieRemoteDatasource: remoteDatasource,
        movieLocalDatasource: localDatasource,
      );

  Future<List<Movie>> getNowPlayingMovies();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();

  Future<List<Movie>> getUpcomingMovies();

  Future<MovieDetails> getMovieDetails(String movieId);

  Future<List<Cast>> getMovieCasts(String movieId);

  Future<void> addMovieToWatchlist(MovieDetails movie);

  Future<MovieDetails?> findWatchlistMovieById(String movieId);

  Stream<List<MovieDetails>> getAllMoviesFromWatchlist();

  Future<void> removeMovieFromWatchlist(String movieId);
}
