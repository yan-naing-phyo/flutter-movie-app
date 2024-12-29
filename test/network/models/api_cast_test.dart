import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/models/models.dart';

void main() {
  group('ApiCast', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          ApiCast.fromJson({}),
          ApiCast(
            adult: false,
            gender: 0,
            id: 0,
            knownForDepartment: '',
            name: '',
            originalName: '',
            popularity: 0.0,
            profilePath: '',
            castId: 0,
            character: '',
            creditId: '',
            order: 0,
          ),
        );
      });

      test('initialize with correct values', () {
        expect(
          ApiCast.fromJson({
            "adult": false,
            "gender": 2,
            "id": 2326151,
            "known_for_department": "Acting",
            "name": "Paul Mescal",
            "original_name": "Paul Mescal",
            "popularity": 53,
            "profile_path": "/vrzZ41TGNAFgfmZjC2sOJySzBLd.jpg",
            "cast_id": 10,
            "character": "Lucius",
            "credit_id": "63b8777a1cfe3a00894541ec",
            "order": 0
          }),
          ApiCast(
            adult: false,
            gender: 2,
            id: 2326151,
            knownForDepartment: 'Acting',
            name: 'Paul Mescal',
            originalName: 'Paul Mescal',
            popularity: 53.0,
            profilePath: '/vrzZ41TGNAFgfmZjC2sOJySzBLd.jpg',
            castId: 10,
            character: 'Lucius',
            creditId: '63b8777a1cfe3a00894541ec',
            order: 0,
          ),
        );
      });
    });
  });
}
