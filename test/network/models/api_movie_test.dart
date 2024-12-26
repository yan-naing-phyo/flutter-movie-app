import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/models/models.dart';

void main() {
  group('ApiMovie', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          ApiMovie.fromJson({}),
          ApiMovie(
            adult: false,
            backdropPath: '',
            genreIds: [],
            id: 0,
            originalLanguage: '',
            originalTitle: '',
            overview: '',
            popularity: 0.0,
            posterPath: '',
            releaseDate: '',
            title: '',
            video: false,
            voteAverage: 0.0,
            voteCount: 0,
          ),
        );
      });

      test('initialize with correct values', () {
        expect(
          ApiMovie.fromJson(
            {
              'adult': false,
              'backdrop_path': '/tElnmtQ6yz1PjN1kePNl8yMSb59.jpg',
              'genre_ids': [16, 12, 10751, 35],
              'id': 1241982,
              'original_language': 'en',
              'original_title': 'Moana 2',
              'overview':
                  'After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she\'s ever faced.',
              'popularity': 2860,
              'poster_path': '/4YZpsylmjHbqeWzjKpUEF8gcLNW.jpg',
              'release_date': '2024-11-21',
              'title': 'Moana 2',
              'video': false,
              'vote_average': 7,
              'vote_count': 519
            },
          ),
          ApiMovie(
            adult: false,
            backdropPath: '/tElnmtQ6yz1PjN1kePNl8yMSb59.jpg',
            genreIds: [16, 12, 10751, 35],
            id: 1241982,
            originalLanguage: 'en',
            originalTitle: 'Moana 2',
            overview:
                'After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she\'s ever faced.',
            popularity: 2860,
            posterPath: '/4YZpsylmjHbqeWzjKpUEF8gcLNW.jpg',
            releaseDate: '2024-11-21',
            title: 'Moana 2',
            video: false,
            voteAverage: 7,
            voteCount: 519,
          ),
        );
      });
    });
  });
}
