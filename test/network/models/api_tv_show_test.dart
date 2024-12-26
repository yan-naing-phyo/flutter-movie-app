import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/models/models.dart';

void main() {
  group('ApiTvShow', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          ApiTvShow.fromJson({}),
          ApiTvShow(
            adult: false,
            backdropPath: '',
            genreIds: [],
            id: 0,
            originCountry: [],
            originalLanguage: '',
            originalName: '',
            overview: '',
            popularity: 0.0,
            posterPath: '',
            firstAirDate: '',
            name: '',
            voteAverage: 0.0,
            voteCount: 0,
          ),
        );
      });

      test('initialize with correct values', () {
        final tvShowJson = {
          "adult": false,
          "backdrop_path": "/vgeDRVpSUa4Hvovg4C6dgm4dfUW.jpg",
          "genre_ids": [10766, 18],
          "id": 112470,
          "origin_country": ["FR"],
          "original_language": "fr",
          "original_name": "Ici tout commence",
          "overview":
              "This television drama series is centered around the prestigious culinary school of renowned chef Auguste Armand. The show follows the lives of students and staff as they navigate the challenges and pressures of the culinary world—delving into their personal and professional lives, revealing secrets, rivalries, and complex relationships.",
          "popularity": 2081,
          "poster_path": "/v7nXPo2zdaIOfeIaERiOuTEt89N.jpg",
          "first_air_date": "2020-11-02",
          "name": "Ici tout commence",
          "vote_average": 6,
          "vote_count": 86
        };

        expect(
          ApiTvShow.fromJson(tvShowJson),
          ApiTvShow(
            adult: false,
            backdropPath: '/vgeDRVpSUa4Hvovg4C6dgm4dfUW.jpg',
            genreIds: [10766, 18],
            id: 112470,
            originCountry: ["FR"],
            originalLanguage: 'fr',
            originalName: 'Ici tout commence',
            overview:
                'This television drama series is centered around the prestigious culinary school of renowned chef Auguste Armand. The show follows the lives of students and staff as they navigate the challenges and pressures of the culinary world—delving into their personal and professional lives, revealing secrets, rivalries, and complex relationships.',
            popularity: 2081.0,
            posterPath: '/v7nXPo2zdaIOfeIaERiOuTEt89N.jpg',
            firstAirDate: '2020-11-02',
            name: 'Ici tout commence',
            voteAverage: 6.0,
            voteCount: 86,
          ),
        );
      });
    });
  });
}
