import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/models/models.dart';
import 'package:flutter_movie_app/network/response/response.dart';

void main() {
  group('PersonListResponse', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          PersonListResponse.fromJson({}),
          PersonListResponse(
            page: 0,
            results: [],
            totalPages: 0,
            totalResults: 0,
          ),
        );
      });

      test('initialize with correct values', () {
        final json = {
          "page": 1,
          "results": [
            {
              "adult": false,
              "gender": 1,
              "id": 141801,
              "known_for_department": "Acting",
              "name": "Paige Tamada",
              "original_name": "Paige Tamada",
              "popularity": 260.381,
              "profile_path": "/pORrZ9gppePMsZBHhwRHvNogFU7.jpg"
            }
          ],
          "total_pages": 10,
          "total_results": 100
        };

        expect(
          PersonListResponse.fromJson(json),
          PersonListResponse(
            page: 1,
            results: [
              ApiPerson(
                adult: false,
                gender: 1,
                id: 141801,
                knownForDepartment: 'Acting',
                name: 'Paige Tamada',
                originalName: 'Paige Tamada',
                popularity: 260.381,
                profilePath: '/pORrZ9gppePMsZBHhwRHvNogFU7.jpg',
              )
            ],
            totalPages: 10,
            totalResults: 100,
          ),
        );
      });
    });
  });
}
