import 'package:flutter_movie_app/data/remote/utils/image_url_builder.dart';
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

    group('getMovieDetails', () {
      test('calls getMovieDetails from movie api with correct movieId',
          () async {
        final movieApi = MockMovieApi();
        final movieRemoteDatasource =
            MovieRemoteDatasourceImpl(movieApi: movieApi);

        when(movieApi.getMovieDetails(any))
            .thenAnswer((_) async => MovieDetailsResponse.fromJson({}));

        await movieRemoteDatasource.getMovieDetails('123');

        verify(movieApi.getMovieDetails('123')).called(1);
      });

      test('throws when getMovieDetails from movie api fails', () async {
        final movieApi = MockMovieApi();
        final movieRemoteDatasource =
            MovieRemoteDatasourceImpl(movieApi: movieApi);
        when(movieApi.getMovieDetails(any)).thenThrow(Exception('fails'));

        expect(
          () async => await movieRemoteDatasource.getMovieDetails('123'),
          throwsA(isA<Exception>()),
        );
      });

      test('converts MovieDetailsResponse into correct domain model', () async {
        final movieDetailsJson = {
          "adult": false,
          "backdrop_path": "/euYIwmwkmz95mnXvufEmbL6ovhZ.jpg",
          "belongs_to_collection": {
            "id": 1069584,
            "name": "Gladiator Collection",
            "poster_path": "/r7uyUOB6fmmPumWwHiV7Hn2kUbL.jpg",
            "backdrop_path": "/1VdLvSIeHuwqCT13H9EafxCacGB.jpg"
          },
          "budget": 310000000,
          "genres": [
            {"id": 28, "name": "Action"},
            {"id": 12, "name": "Adventure"},
            {"id": 18, "name": "Drama"}
          ],
          "homepage": "https://www.gladiator.movie",
          "id": 558449,
          "imdb_id": "tt9218128",
          "origin_country": ["US"],
          "original_language": "en",
          "original_title": "Gladiator II",
          "overview":
              "Years after witnessing the death of the revered hero Maximus at the hands of his uncle, Lucius is forced to enter the Colosseum after his home is conquered by the tyrannical Emperors who now lead Rome with an iron fist. With rage in his heart and the future of the Empire at stake, Lucius must look to his past to find strength and honor to return the glory of Rome to its people.",
          "popularity": 5872.166,
          "poster_path": "/2cxhvwyEwRlysAmRH4iodkvo0z5.jpg",
          "production_companies": [
            {
              "id": 4,
              "logo_path": "/gz66EfNoYPqHTYI4q9UEN4CbHRc.png",
              "name": "Paramount Pictures",
              "origin_country": "US"
            },
            {
              "id": 221347,
              "logo_path": "/6Ry6uNBaa0IbbSs1XYIgX5DkA9r.png",
              "name": "Scott Free Productions",
              "origin_country": "US"
            },
            {
              "id": 246486,
              "logo_path": null,
              "name": "Lucy Fisher/Douglas Wick Productions",
              "origin_country": "US"
            }
          ],
          "production_countries": [
            {"iso_3166_1": "US", "name": "United States of America"}
          ],
          "release_date": "2024-11-05",
          "revenue": 422417355,
          "runtime": 148,
          "spoken_languages": [
            {"english_name": "English", "iso_639_1": "en", "name": "English"}
          ],
          "status": "Released",
          "tagline": "Prepare to be entertained.",
          "title": "Gladiator II",
          "video": false,
          "vote_average": 6.761,
          "vote_count": 1522
        };
        final movieId = '123';
        final movieApi = MockMovieApi();
        final movieRemoteDatasource =
            MovieRemoteDatasourceImpl(movieApi: movieApi);
        when(movieApi.getMovieDetails(any)).thenAnswer(
            (_) async => MovieDetailsResponse.fromJson(movieDetailsJson));

        final result = await movieRemoteDatasource.getMovieDetails(movieId);

        expect(
          result,
          isA<MovieDetails>()
              .having((m) => m.backdropImageUrl, 'backdropImageUrl', isNotEmpty)
              .having((m) => m.budget, 'budget', 310000000)
              .having((m) => m.genres.length, 'genres', 3)
              .having(
                  (m) => m.homepage, 'homepage', 'https://www.gladiator.movie')
              .having((m) => m.id, 'id', 558449)
              .having((m) => m.imdbId, 'imdbId', 'tt9218128')
              .having((m) => m.originCountry, 'originCountry', contains('US'))
              .having((m) => m.originalLanguage, 'originalLanguage', 'en')
              .having((m) => m.originalTitle, 'originalTitle', 'Gladiator II')
              .having((m) => m.overview, 'overview',
                  'Years after witnessing the death of the revered hero Maximus at the hands of his uncle, Lucius is forced to enter the Colosseum after his home is conquered by the tyrannical Emperors who now lead Rome with an iron fist. With rage in his heart and the future of the Empire at stake, Lucius must look to his past to find strength and honor to return the glory of Rome to its people.')
              .having((m) => m.popularity, 'popularity', 5872.166)
              .having((m) => m.posterImageUrl, 'posterImageUrl', isNotEmpty)
              .having(
                  (m) => m.productionCompanies.length, 'productionCompanies', 3)
              .having(
                  (m) => m.productionCountries.length, 'productionCountries', 1)
              .having((m) => m.releaseDate, 'releaseDate',
                  DateTime(2024, 11, 5)) // 2024-11-05
              .having((m) => m.revenue, 'revenue', 422417355)
              .having((m) => m.runtime, 'runtime', 148)
              .having((m) => m.spokenLanguages, 'spokenLanguages', 'English')
              .having((m) => m.status, 'status', 'Released')
              .having((m) => m.tagline, 'tagline', 'Prepare to be entertained.')
              .having((m) => m.title, 'title', 'Gladiator II')
              .having((m) => m.voteAverage, 'voteAverage', 6.761)
              .having((m) => m.voteCount, 'voteCount', 1522),
        );
      });
    });

    group('getMovieCasts', () {
      test('calls getMovieCredits from movie api', () async {
        const movieId = '123';
        final movieApi = MockMovieApi();
        final movieRemoteDatasource =
            MovieRemoteDatasourceImpl(movieApi: movieApi);
        when(movieApi.getMovieCredits(any))
            .thenAnswer((_) async => MovieCreditsResponse.fromJson({
                  "id": 558449,
                  "cast": [
                    {
                      "adult": false,
                      "gender": 1,
                      "id": 935,
                      "known_for_department": "Acting",
                      "name": "Connie Nielsen",
                      "original_name": "Connie Nielsen",
                      "popularity": 82.692,
                      "profile_path": "/lvQypTfeH2Gn2PTbzq6XkT2PLmn.jpg",
                      "cast_id": 26,
                      "character": "Lucilla",
                      "credit_id": "644bfc03336e0105177379a2",
                      "order": 3
                    }
                  ]
                }));

        final result = await movieRemoteDatasource.getMovieCasts(movieId);

        expect(
          result,
          [
            Cast(
              gender: Gender.female,
              id: 935,
              knownForDepartment: 'Acting',
              name: 'Connie Nielsen',
              popularity: 82.692,
              profileImageUrl: ImageUrlBuilder.buildProfileImageUrl(
                  '/lvQypTfeH2Gn2PTbzq6XkT2PLmn.jpg')!,
              castId: 26,
              character: 'Lucilla',
              creditId: '644bfc03336e0105177379a2',
              order: 3,
            ),
          ],
        );
        verify(movieApi.getMovieCredits(movieId)).called(1);
      });

      test('throws when getMovieCredits from movie api fails', () {
        const movieId = '123';
        final movieApi = MockMovieApi();
        final movieRemoteDatasource =
            MovieRemoteDatasourceImpl(movieApi: movieApi);
        when(movieApi.getMovieCredits(any)).thenThrow(Exception('fails'));

        expect(
          () async => movieRemoteDatasource.getMovieCasts(movieId),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
