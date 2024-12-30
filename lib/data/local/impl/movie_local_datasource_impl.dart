import 'dart:async';
import 'dart:convert';

import 'package:flutter_movie_app/data/local/movie_local_datasource.dart';
import 'package:flutter_movie_app/data/models/movie_details.dart';
import 'package:flutter_movie_app/persistence/daos/movie_dao.dart';
import 'package:flutter_movie_app/persistence/models/movie.dart';

class MovieLocalDatasourceImpl implements MovieLocalDatasource {
  MovieLocalDatasourceImpl({required this.movieDao}) {
    _emitAllMovies();
  }

  final MovieDao movieDao;

  final StreamController<List<MovieDetails>> _streamController =
      StreamController();

  @override
  Future<void> insertMovie(MovieDetails movie) async {
    await movieDao.insertMovie(movie.toDbMovie());

    await _emitAllMovies();
  }

  @override
  Future<MovieDetails?> findMovieById(String movieId) async {
    final dbMovie = await movieDao.findMovieById(movieId);

    return dbMovie?.toDomainMovieDetails();
  }

  @override
  Stream<List<MovieDetails>> getAllMovies() {
    return _streamController.stream;
  }

  Future<void> _emitAllMovies() async {
    // Retrieve movies from database.
    final dbMovies = await movieDao.getAllMovies();
    final movies = dbMovies
        .map(
          (e) => e.toDomainMovieDetails(),
        )
        .toList();

    _streamController.sink.add(movies);
  }

  @override
  Future<void> deleteMovie(String movieId) async {
    await movieDao.deleteMovie(movieId);

    await _emitAllMovies();
  }
}

extension on MovieDetails {
  DbMovie toDbMovie() {
    return DbMovie(
      backdropImageUrl: backdropImageUrl,
      budget: budget,
      genres: jsonEncode(genres
          .map(
            (e) => e.toMap(),
          )
          .toList()),
      homepage: homepage,
      id: id,
      imdbId: imdbId,
      originCountry: jsonEncode(originCountry),
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterImageUrl: posterImageUrl,
      productionCompanies: jsonEncode(productionCompanies
          .map(
            (e) => e.toMap(),
          )
          .toList()),
      productionCountries: jsonEncode(productionCountries
          .map(
            (e) => e.toMap(),
          )
          .toList()),
      releaseDate: releaseDate.toString(),
      revenue: revenue,
      runtime: runtime,
      spokenLanguages: spokenLanguages,
      status: status,
      tagline: tagline,
      title: title,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}

extension on DbMovie {
  MovieDetails toDomainMovieDetails() => MovieDetails(
        backdropImageUrl: backdropImageUrl,
        budget: budget,
        genres: [],
        homepage: homepage,
        id: id,
        imdbId: imdbId,
        originCountry: [],
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterImageUrl: posterImageUrl,
        productionCompanies: [],
        productionCountries: [],
        releaseDate: DateTime.tryParse(releaseDate),
        revenue: revenue,
        runtime: runtime,
        spokenLanguages: spokenLanguages,
        status: status,
        tagline: tagline,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}
