import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/remote/impl/movie_remote_datasource_impl.dart';
import 'package:flutter_movie_app/network/models/models.dart';
import 'package:flutter_movie_app/network/response/response.dart';
import 'package:flutter_movie_app/network/movie_api.dart';

@GenerateNiceMocks([MockSpec<MovieApi>()])
import 'movie_remote_datasource_impl_test.mocks.dart';

const _movieListResponse = MovieListResponse(
  page: 1,
  results: [
    ApiMovie(
      adult: false,
      backdropPath: '/eK8HiCLv4zo6iZ0NbjZnmD9LZkd.jpg',
      genreIds: [16, 28, 878, 10751],
      id: 1184918,
      originalLanguage: 'en',
      originalTitle: 'The Wild Robot',
      overview: 'overview',
      popularity: 100.0,
      posterPath: '/wTnV3PCVW5O92JMrFvvrRcV39RU.jpg',
      releaseDate: '2024-09-08',
      title: 'The Wild Robot',
      video: false,
      voteAverage: 8.383,
      voteCount: 3506,
    ),
  ],
  totalPages: 12,
  totalResults: 100,
);

void main() {
  group('MovieRemoteDatasourceImpl', () {
    group('getPopularMovies', () {
      test('calls getPopularMovies from movie api', () async {
        final movieApi = MockMovieApi();
        final movieRemoteDatasource = MovieRemoteDatasourceImpl(
          movieApi: movieApi,
        );
        when(movieApi.getPopularMovies())
            .thenAnswer((_) async => _movieListResponse);

        final result = await movieRemoteDatasource.getPopularMovies();

        expect(
          result,
          contains(
            isA<Movie>()
                .having(
                    (m) => m.backdropImageUrl, 'backdropImageUrl', isNotEmpty)
                .having((m) => m.id, 'id', equals(1184918))
                .having((m) => m.overview, 'overview', equals('overview'))
                .having((m) => m.popularity, 'popularity', equals(100.0))
                .having((m) => m.posterImageUrl, 'posterImageUrl', isNotEmpty)
                .having(
                  (m) => m.releaseDate,
                  'releaseDate',
                  DateTime(2024, 9, 8),
                )
                .having((m) => m.title, 'title', 'The Wild Robot')
                .having((m) => m.voteAverage, 'voteAverage', equals(8.383))
                .having((m) => m.voteCount, 'voteCount', equals(3506)),
          ),
        );
        verify(movieApi.getPopularMovies()).called(1);
      });

      test('throws when getPopularMovies from movie api fails', () {
        final movieApi = MockMovieApi();
        final movieRemoteDatasource =
            MovieRemoteDatasourceImpl(movieApi: movieApi);
        when(movieApi.getPopularMovies()).thenThrow(Exception('failed'));

        expect(
          () async => movieRemoteDatasource.getPopularMovies(),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
