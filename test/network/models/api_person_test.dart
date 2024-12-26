import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/models/models.dart';

void main() {
  group('ApiPerson', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          ApiPerson.fromJson({}),
          ApiPerson(
            adult: false,
            gender: 0,
            id: 0,
            knownForDepartment: '',
            name: '',
            originalName: '',
            popularity: 0.0,
            profilePath: '',
          ),
        );
      });

      test('initialize with correct values', () {
        final apiPersonJson = {
          "adult": false,
          "gender": 2,
          "id": 3724154,
          "known_for_department": "Acting",
          "name": "Lou Goossens",
          "original_name": "Lou Goossens",
          "popularity": 389,
          "profile_path": "/kY8eifhCPvjTE6JJclrrWO7Zr9L.jpg"
        };
        expect(
          ApiPerson.fromJson(apiPersonJson),
          ApiPerson(
            adult: false,
            gender: 2,
            id: 3724154,
            knownForDepartment: 'Acting',
            name: 'Lou Goossens',
            originalName: 'Lou Goossens',
            popularity: 389.0,
            profilePath: '/kY8eifhCPvjTE6JJclrrWO7Zr9L.jpg',
          ),
        );
      });
    });
  });
}
