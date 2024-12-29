import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_movie_app/network/request_builder.dart';
import 'package:flutter_movie_app/network/tmdb_api.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'tmdb_api_test.mocks.dart';

const _baseUrl = 'api.themoviedb.org';
const _mockApiKey = 'apiKey';

void main() {
  late MockClient httpClient;
  late RequestBuilder requestBuilder;
  late TmdbApi tmdbApi;

  setUp(() {
    httpClient = MockClient();
    requestBuilder = RequestBuilder(
      apiBaseUrl: _baseUrl,
      apiKey: _mockApiKey,
    );

    tmdbApi = TmdbApi(
      httpClient: httpClient,
      requestBuilder: requestBuilder,
    );

    when(httpClient.get(any)).thenAnswer((_) async => http.Response('{}', 200));
  });

  group('TmdbApi', () {
    group('getNowPlayingMovies', () {
      test('calls getNowPlayingMovies end-point', () async {
        await tmdbApi.getNowPlayingMovies();

        final url = Uri.https('api.themoviedb.org', '/3/movie/now_playing',
            {'api_key': _mockApiKey});
        verify(httpClient.get(url)).called(1);
      });

      test('throws MovieRequestFailure on non-200 response', () async {
        when(httpClient.get(any))
            .thenAnswer((_) async => http.Response('{}', 400));

        expect(
          () async => tmdbApi.getNowPlayingMovies(),
          throwsA(isA<MovieRequestFailure>()),
        );
      });
    });

    group('getPopularMovies', () {
      test('calls getPopularMovies end-point', () async {
        await tmdbApi.getPopularMovies();

        final url = Uri.https(
            'api.themoviedb.org', '/3/movie/popular', {'api_key': _mockApiKey});
        verify(httpClient.get(url)).called(1);
      });

      test('throws MovieRequestFailure on non-200 response', () async {
        when(httpClient.get(any))
            .thenAnswer((_) async => http.Response('{}', 400));

        expect(
          () async => tmdbApi.getPopularMovies(),
          throwsA(isA<MovieRequestFailure>()),
        );
      });
    });

    group('getTopRatedMovies', () {
      test('calls getTopRatedMovies end-point', () async {
        await tmdbApi.getTopRatedMovies();

        final url = Uri.https('api.themoviedb.org', '/3/movie/top_rated',
            {'api_key': _mockApiKey});
        verify(httpClient.get(url)).called(1);
      });

      test('throws MovieRequestFailure on non-200 response', () async {
        when(httpClient.get(any))
            .thenAnswer((_) async => http.Response('{}', 400));

        expect(
          () async => tmdbApi.getTopRatedMovies(),
          throwsA(isA<MovieRequestFailure>()),
        );
      });
    });

    group('getUpcomingMovies', () {
      test('calls getUpcomingMovies end-point', () async {
        await tmdbApi.getUpcomingMovies();

        final url = Uri.https('api.themoviedb.org', '/3/movie/upcoming',
            {'api_key': _mockApiKey});
        verify(httpClient.get(url)).called(1);
      });

      test('throws MovieRequestFailure on non-200 response', () async {
        when(httpClient.get(any))
            .thenAnswer((_) async => http.Response('{}', 400));

        expect(
          () async => tmdbApi.getUpcomingMovies(),
          throwsA(isA<MovieRequestFailure>()),
        );
      });
    });

    group('getPopularTvShows', () {
      test('calls getPopularTvShows end-point', () async {
        await tmdbApi.getPopularTvShows();

        final url = Uri.https(
            'api.themoviedb.org', '/3/tv/popular', {'api_key': _mockApiKey});
        verify(httpClient.get(url)).called(1);
      });

      test('throws TvShowRequestFailure on non-200 response', () async {
        when(httpClient.get(any))
            .thenAnswer((_) async => http.Response('{}', 400));

        expect(
          () async => tmdbApi.getPopularTvShows(),
          throwsA(isA<TvShowRequestFailure>()),
        );
      });
    });

    group('getPopularPeople', () {
      test('calls getPopularPeople end-point', () async {
        await tmdbApi.getPopularPeople();

        final url = Uri.https('api.themoviedb.org', '/3/person/popular',
            {'api_key': _mockApiKey});
        verify(httpClient.get(url)).called(1);
      });

      test('throws PersonRequestFailure on non-200 response', () async {
        when(httpClient.get(any))
            .thenAnswer((_) async => http.Response('{}', 400));

        expect(
          () async => tmdbApi.getPopularPeople(),
          throwsA(isA<PersonRequestFailure>()),
        );
      });
    });

    group('getMovieDetails', () {
      test('calls getMovieDetails end-point with correct movieId', () async {
        final movieId = '123';

        await tmdbApi.getMovieDetails(movieId);

        verify(
          httpClient.get(
            Uri.https('api.themoviedb.org', '/3/movie/$movieId',
                {'api_key': _mockApiKey}),
          ),
        ).called(1);
      });

      test('throws MovieDetailsRequestFailure on non-200 response', () async {
        when(httpClient.get(any))
            .thenAnswer((_) async => http.Response('{}', 400));

        expect(
          () async => tmdbApi.getMovieDetails('123'),
          throwsA(isA<MovieDetailsRequestFailure>()),
        );
      });
    });

    group('getMovieCredits', () {
      test('calls getMovieCredits end-point with correct movieId', () async {
        final movieId = '123';

        await tmdbApi.getMovieCredits(movieId);

        verify(
          httpClient.get(
            Uri.https('api.themoviedb.org', '/3/movie/$movieId/credits',
                {'api_key': _mockApiKey}),
          ),
        ).called(1);
      });

      test('throws MovieCreditsRequestFailure when status code is non-200', () {
        when(httpClient.get(any))
            .thenAnswer((_) async => http.Response('{}', 400));

        expect(
          () async => tmdbApi.getMovieCredits('123'),
          throwsA(isA<MovieCreditsRequestFailure>()),
        );
      });
    });
  });
}
