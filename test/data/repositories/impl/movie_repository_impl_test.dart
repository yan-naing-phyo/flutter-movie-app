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
  });
}
