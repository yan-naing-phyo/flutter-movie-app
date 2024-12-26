import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/models/models.dart';
import 'package:flutter_movie_app/network/response/response.dart';

void main() {
  group('TvShowListResponse', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          TvShowListResponse.fromJson({}),
          TvShowListResponse(
            page: 0,
            results: [],
            totalPages: 0,
            totalResults: 0,
          ),
        );
      });

      test('initialize with correct values', () {
        final tvShowListResponseJson = {
          "page": 1,
          "results": [
            {
              "adult": false,
              "backdrop_path": "/wAZREM1qfwHFdXISMpjscwBXuUf.jpg",
              "genre_ids": [10767],
              "id": 112261,
              "origin_country": ["DE"],
              "original_language": "de",
              "original_name": "Abendschau",
              "overview":
                  "The Berliner Abendschau is the news magazine for Berlin.",
              "popularity": 2031.778,
              "poster_path": "/A9j8yRrHPcVPVpoYt754t0BrtdB.jpg",
              "first_air_date": "2000-05-04",
              "name": "Abendschau",
              "vote_average": 2,
              "vote_count": 1
            }
          ],
          "total_pages": 9402,
          "total_results": 188027
        };

        expect(
          TvShowListResponse.fromJson(tvShowListResponseJson),
          TvShowListResponse(
            page: 1,
            results: [
              ApiTvShow(
                adult: false,
                backdropPath: '/wAZREM1qfwHFdXISMpjscwBXuUf.jpg',
                genreIds: [10767],
                id: 112261,
                originCountry: ['DE'],
                originalLanguage: 'de',
                originalName: 'Abendschau',
                overview:
                    'The Berliner Abendschau is the news magazine for Berlin.',
                popularity: 2031.778,
                posterPath: '/A9j8yRrHPcVPVpoYt754t0BrtdB.jpg',
                firstAirDate: '2000-05-04',
                name: 'Abendschau',
                voteAverage: 2,
                voteCount: 1,
              ),
            ],
            totalPages: 9402,
            totalResults: 188027,
          ),
        );
      });
    });
  });
}
