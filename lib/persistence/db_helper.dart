import 'package:flutter_movie_app/persistence/daos/impl/movie_dao_impl.dart';
import 'package:flutter_movie_app/persistence/daos/movie_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const dbName = 'movie_database.db';
const moviesTable = 'movies';

class DbHelper {
  DbHelper._();

  static DbHelper get instance => DbHelper._();

  MovieDao get movieDao => MovieDaoImpl(dbHelper: this);

  late Future<Database> database;

  Future<void> initialize() async {
    final path = join(await getDatabasesPath(), dbName);

    database = openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE $moviesTable(id INTEGER PRIMARY KEY, backdropImageUrl TEXT, budget INTEGER, genres TEXT, homepage TEXT, imdbId TEXT, originCountry TEXT, originalLanguage TEXT, originalTitle TEXT, overview TEXT, popularity REAL, posterImageUrl TEXT, productionCompanies TEXT, productionCountries TEXT, releaseDate TEXT, revenue INTEGER, runtime INTEGER, spokenLanguages TEXT, status TEXT, tagline TEXT, title TEXT, voteAverage REAL, voteCount INTEGER)');
      },
      version: 1,
    );
  }
}
