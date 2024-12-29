import 'package:flutter_movie_app/network/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/response/response.dart';

void main() {
  group('MovieCreditsResponse', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          MovieCreditsResponse.fromJson({}),
          MovieCreditsResponse(
            id: 0,
            cast: [],
          ),
        );
      });

      test('initialize with correct values', () {
        expect(
          MovieCreditsResponse.fromJson({
            "id": 558449,
            "cast": [
              {
                "adult": false,
                "gender": 2,
                "id": 5292,
                "known_for_department": "Acting",
                "name": "Denzel Washington",
                "original_name": "Denzel Washington",
                "popularity": 75.152,
                "profile_path": "/9Iyt3wbsla5bM6IzbICDVnBhkER.jpg",
                "cast_id": 25,
                "character": "Macrinus",
                "credit_id": "641493c3ede1b028c599148f",
                "order": 1
              }
            ]
          }),
          MovieCreditsResponse(
            id: 558449,
            cast: [
              ApiCast(
                adult: false,
                gender: 2,
                id: 5292,
                knownForDepartment: 'Acting',
                name: 'Denzel Washington',
                originalName: 'Denzel Washington',
                popularity: 75.152,
                profilePath: '/9Iyt3wbsla5bM6IzbICDVnBhkER.jpg',
                castId: 25,
                character: 'Macrinus',
                creditId: '641493c3ede1b028c599148f',
                order: 1,
              ),
            ],
          ),
        );
      });
    });
  });
}
