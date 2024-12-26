import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/models/models.dart';
import 'package:flutter_movie_app/network/response/response.dart';

void main() {
  group('MovieListResponse', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          MovieListResponse.fromJson({}),
          MovieListResponse(
            page: 0,
            results: [],
            totalPages: 0,
            totalResults: 0,
          ),
        );
      });

      test('initialize with correct values', () {
        expect(
          MovieListResponse.fromJson({
            'page': 1,
            'results': [
              {
                'adult': false,
                'backdrop_path': '/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg',
                'genre_ids': [28, 878, 12, 53],
                'id': 912649,
                'original_language': 'en',
                'original_title': 'Venom: The Last Dance',
                'overview':
                    'Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie\'s last dance.',
                'popularity': 5097.39,
                'poster_path': '/aosm8NMQ3UyoBVpSxyimorCQykC.jpg',
                'release_date': '2024-10-22',
                'title': 'Venom: The Last Dance',
                'video': false,
                'vote_average': 6.783,
                'vote_count': 1663
              },
            ],
            'total_pages': 10,
            'total_results': 100,
          }),
          MovieListResponse(
            page: 1,
            results: [
              ApiMovie(
                adult: false,
                backdropPath: '/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg',
                genreIds: [28, 878, 12, 53],
                id: 912649,
                originalLanguage: 'en',
                originalTitle: 'Venom: The Last Dance',
                overview:
                    'Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie\'s last dance.',
                popularity: 5097.39,
                posterPath: '/aosm8NMQ3UyoBVpSxyimorCQykC.jpg',
                releaseDate: '2024-10-22',
                title: 'Venom: The Last Dance',
                video: false,
                voteAverage: 6.783,
                voteCount: 1663,
              ),
            ],
            totalPages: 10,
            totalResults: 100,
          ),
        );
      });
    });
  });
}
