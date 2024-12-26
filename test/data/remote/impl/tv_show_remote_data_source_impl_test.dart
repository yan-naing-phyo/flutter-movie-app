import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/remote/impl/tv_show_remote_datasource_impl.dart';
import 'package:flutter_movie_app/network/models/models.dart';
import 'package:flutter_movie_app/network/response/response.dart';
import 'package:flutter_movie_app/network/movie_api.dart';

@GenerateNiceMocks([MockSpec<MovieApi>()])
import 'tv_show_remote_data_source_impl_test.mocks.dart';

const _tvShowListResponse = TvShowListResponse(
  page: 1,
  results: [
    ApiTvShow(
      adult: false,
      backdropPath: '/zk3UqXnnK7cpUv6LsD9DS8FtUxb.jpg',
      genreIds: [18, 10759],
      id: 256121,
      originCountry: ['PH'],
      originalLanguage: 'tl',
      originalName: 'Lavender Fields',
      overview: 'overview',
      popularity: 1557.8,
      posterPath: '/lphvsr062SlxWM6XegsV2dLGaiE.jpg',
      firstAirDate: '2024-09-02',
      name: 'Lavender Fields',
      voteAverage: 8.2,
      voteCount: 5,
    ),
  ],
  totalPages: 10,
  totalResults: 100,
);

void main() {
  group('TvShowRemoteDataSourceImpl', () {
    group('getPopularTvShows', () {
      test('calls getPopularTvShows from movie api', () async {
        final movieApi = MockMovieApi();
        final remoteDatasource = TvShowRemoteDatasourceImpl(movieApi: movieApi);
        when(movieApi.getPopularTvShows())
            .thenAnswer((_) async => _tvShowListResponse);

        final result = await remoteDatasource.getPopularTvShows();

        expect(
          result,
          contains(
            isA<TvShow>()
                .having(
                    (p0) => p0.backdropImageUrl, 'backdropImageUrl', isNotEmpty)
                .having((p0) => p0.id, 'id', equals(256121))
                .having((p0) => p0.originalName, 'originalName',
                    equals('Lavender Fields'))
                .having((p0) => p0.overview, 'overview', equals('overview'))
                .having((p0) => p0.popularity, 'popularity', equals(1557.8))
                .having((p0) => p0.posterImageUrl, 'posterImageUrl', isNotEmpty)
                .having((p0) => p0.firstAirDate, 'firstAirDate',
                    equals('2024-09-02'))
                .having((p0) => p0.name, 'name', equals('Lavender Fields'))
                .having((p0) => p0.voteAverage, 'voteAverage', 8.2)
                .having((p0) => p0.voteCount, 'voteCount', 5),
          ),
        );
        verify(movieApi.getPopularTvShows()).called(1);
      });

      test('throws when getPopularTvShows from movie api fails', () async {
        final movieApi = MockMovieApi();
        final remoteDatasource = TvShowRemoteDatasourceImpl(movieApi: movieApi);
        when(movieApi.getPopularTvShows()).thenThrow(Exception('failure'));

        expect(
          () async => remoteDatasource.getPopularTvShows(),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
