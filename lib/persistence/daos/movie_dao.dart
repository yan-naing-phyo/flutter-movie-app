import 'package:flutter_movie_app/persistence/models/movie.dart';

abstract class MovieDao {
  const MovieDao();

  Future<void> insertMovie(DbMovie movie);

  Future<DbMovie?> findMovieById(String movieId);

  Future<List<DbMovie>> getAllMovies();

  Future<void> updateMovie(DbMovie movie);

  Future<void> deleteMovie(String movieId);
}
