import 'package:flutter_movie_app/persistence/daos/movie_dao.dart';
import 'package:flutter_movie_app/persistence/db_helper.dart';
import 'package:flutter_movie_app/persistence/models/movie.dart';
import 'package:sqflite/sqflite.dart';

class MovieDaoImpl implements MovieDao {
  const MovieDaoImpl({required this.dbHelper});

  final DbHelper dbHelper;

  @override
  Future<void> insertMovie(DbMovie movie) async {
    final db = await dbHelper.database;

    await db.insert(
      moviesTable,
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<DbMovie?> findMovieById(String movieId) async {
    final db = await dbHelper.database;

    final movieMaps = await db.query(
      moviesTable,
      where: 'id = ?',
      whereArgs: [movieId],
      limit: 1,
    );

    final first = movieMaps.firstOrNull;

    return first == null ? null : DbMovie.fromMap(first);
  }

  @override
  Future<List<DbMovie>> getAllMovies() async {
    final db = await dbHelper.database;

    final movieMaps = await db.query(moviesTable);

    return movieMaps
        .map(
          (e) => DbMovie.fromMap(e),
        )
        .toList();
  }

  @override
  Future<void> updateMovie(DbMovie movie) async {
    final db = await dbHelper.database;

    await db.update(
      moviesTable,
      movie.toMap(),
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  @override
  Future<void> deleteMovie(String movieId) async {
    final db = await dbHelper.database;

    await db.delete(
      moviesTable,
      where: 'id = ?',
      whereArgs: [movieId],
    );
  }
}
