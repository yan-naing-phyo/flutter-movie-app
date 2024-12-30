import 'package:flutter_movie_app/data/local/impl/movie_local_datasource_impl.dart';
import 'package:flutter_movie_app/data/models/movie_details.dart';
import 'package:flutter_movie_app/persistence/daos/movie_dao.dart';

abstract class MovieLocalDatasource {
  factory MovieLocalDatasource(MovieDao movieDao) =>
      MovieLocalDatasourceImpl(movieDao: movieDao);

  Future<void> insertMovie(MovieDetails movie);

  Future<MovieDetails?> findMovieById(String movieId);

  Stream<List<MovieDetails>> getAllMovies();

  Future<void> deleteMovie(String movieId);
}
