import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/remote/tv_show_remote_datasource.dart';
import 'package:flutter_movie_app/data/repositories/impl/tv_show_repository_impl.dart';

@GenerateNiceMocks([MockSpec<TvShowRemoteDatasource>()])
import 'tv_show_repository_impl_test.mocks.dart';

const _tvShow = TvShow(
  backdropImageUrl: 'backdropImageUrl',
  id: 248890,
  originalName: 'Ready Steady Cook South Africa',
  overview: 'overview',
  popularity: 1933.675,
  posterImageUrl: 'posterImageUrl',
  firstAirDate: '2024-03-18',
  name: 'Ready Steady Cook South Africa',
  voteAverage: 2.9,
  voteCount: 7,
);

void main() {
  group('TvShowRepositoryImpl', () {
    group('getPopularTvShows', () {
      test('calls getPopularTvShows from remote datasource', () async {
        final remoteDatasource = MockTvShowRemoteDatasource();
        final repository =
            TvShowRepositoryImpl(remoteDatasource: remoteDatasource);
        when(remoteDatasource.getPopularTvShows())
            .thenAnswer((_) async => [_tvShow]);

        final result = await repository.getPopularTvShows();

        expect([_tvShow], result);
        verify(remoteDatasource.getPopularTvShows()).called(1);
      });

      test('throws when getPopularTvShows from remote datasource fails',
          () async {
        final remoteDatasource = MockTvShowRemoteDatasource();
        final repository =
            TvShowRepositoryImpl(remoteDatasource: remoteDatasource);
        when(remoteDatasource.getPopularTvShows()).thenThrow(Exception('fail'));

        expect(
          () async => repository.getPopularTvShows(),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
