import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/repositories/impl/movie_repository_impl.dart';
import 'package:flutter_movie_app/data/remote/movie_remote_datasource.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDatasource>()])
import 'movie_repository_impl_test.mocks.dart';

final _movie = Movie(
  backdropImageUrl: 'backdropUrl',
  id: 939243,
  overview:
      'Sonic, Knuckles, and Tails reunite against a powerful new adversary, Shadow, a mysterious villain with powers unlike anything they have faced before. With their abilities outmatched in every way, Team Sonic must seek out an unlikely alliance in hopes of stopping Shadow and protecting the planet.',
  popularity: 1012.04,
  posterImageUrl: 'posterUrl',
  releaseDate: DateTime(2024, 12, 19),
  title: 'Sonic the Hedgehog 3',
  voteAverage: 7.8,
  voteCount: 8,
);

final fakeMovieDetails = MovieDetails(
  backdropImageUrl: 'backdropImageUrl',
  budget: 1000,
  genres: [],
  homepage: 'homepage',
  id: 123,
  imdbId: 'imdbId',
  originCountry: [],
  originalLanguage: 'originalLanguage',
  originalTitle: 'originalTitle',
  overview: 'overview',
  popularity: 100.0,
  posterImageUrl: 'posterImageUrl',
  productionCompanies: [],
  productionCountries: [],
  releaseDate: DateTime(2024),
  revenue: 2000,
  runtime: 145,
  spokenLanguages: 'spokenLanguages',
  status: 'status',
  tagline: 'tagline',
  title: 'title',
  voteAverage: 12.0,
  voteCount: 100,
);

void main() {
  group('MovieRepositoryImpl', () {
    group('getPopularMovies', () {
      test('calls getPopularMovies from remote datasource', () async {
        final movieRemoteDatasource = MockMovieRemoteDatasource();
        final movieRepository = MovieRepositoryImpl(
          movieRemoteDatasource: movieRemoteDatasource,
        );
        when(movieRemoteDatasource.getPopularMovies())
            .thenAnswer((_) async => [_movie]);

        final result = await movieRepository.getPopularMovies();

        expect([_movie], result);
        verify(movieRemoteDatasource.getPopularMovies()).called(1);
      });

      test('throws when getPopularMovies from remote datasource fails',
          () async {
        final movieRemoteDatasource = MockMovieRemoteDatasource();
        final movieRepository =
            MovieRepositoryImpl(movieRemoteDatasource: movieRemoteDatasource);
        when(movieRemoteDatasource.getPopularMovies())
            .thenThrow(Exception('error'));

        expect(
          () async => movieRepository.getPopularMovies(),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('getMovieDetails', () {
      const movieId = '123';

      test('calls getMovieDetails from remote source with correct movieId',
          () async {
        final remoteSource = MockMovieRemoteDatasource();
        final repository =
            MovieRepositoryImpl(movieRemoteDatasource: remoteSource);

        await repository.getMovieDetails(movieId);

        verify(remoteSource.getMovieDetails(movieId)).called(1);
      });

      test('throws when getMovieDetails from remote source fails', () {
        final remoteSource = MockMovieRemoteDatasource();
        final repository =
            MovieRepositoryImpl(movieRemoteDatasource: remoteSource);
        when(remoteSource.getMovieDetails(movieId)).thenThrow(Exception('fails'));

        expect(
          () async => repository.getMovieDetails(movieId),
          throwsA(isA<Exception>()),
        );
      });

      test(
          'returns the correct MovieDetails when getMovieDetails from remote source success',
          () async {
        final remoteSource = MockMovieRemoteDatasource();
        final repository =
            MovieRepositoryImpl(movieRemoteDatasource: remoteSource);
        when(remoteSource.getMovieDetails(movieId))
            .thenAnswer((_) async => fakeMovieDetails);

        final result = await repository.getMovieDetails(movieId);

        expect(result, fakeMovieDetails);
      });
    });

    group('getMovieCasts', () {
      const movieId = '123';

      const fakeMovieCasts = [
        Cast(
          gender: Gender.male,
          id: 123,
          knownForDepartment: 'knownForDepartment',
          name: 'name',
          popularity: 123.0,
          profileImageUrl: 'profileImageUrl',
          castId: 12345,
          character: 'character',
          creditId: 'creditId',
          order: 0,
        ),
      ];

      test('calls getMovieCasts from remote datasource', () async {
        final movieRemoteDatasource = MockMovieRemoteDatasource();
        final movieRepository =
            MovieRepositoryImpl(movieRemoteDatasource: movieRemoteDatasource);
        when(movieRemoteDatasource.getMovieCasts(movieId))
            .thenAnswer((_) async => fakeMovieCasts);

        final result = await movieRepository.getMovieCasts(movieId);

        expect(result, fakeMovieCasts);
        verify(movieRemoteDatasource.getMovieCasts(movieId)).called(1);
      });

      test('throws when getMovieCasts from remote datasource fails', () {
        final movieRemoteDatasource = MockMovieRemoteDatasource();
        final movieRepository =
            MovieRepositoryImpl(movieRemoteDatasource: movieRemoteDatasource);
        when(movieRemoteDatasource.getMovieCasts(movieId))
            .thenThrow(Exception('fails'));

        expect(
          () async => movieRepository.getMovieCasts(movieId),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
