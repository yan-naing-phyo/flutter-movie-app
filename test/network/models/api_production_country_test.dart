import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/models/models.dart';

void main() {
  group('ApiProductionCountry', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          ApiProductionCountry.fromJson({}),
          ApiProductionCountry(iso_3166_1: '', name: ''),
        );
      });

      test('initialize with correct values', () {
        final json = {"iso_3166_1": "US", "name": "United States of America"};

        expect(
          ApiProductionCountry.fromJson(json),
          ApiProductionCountry(
            iso_3166_1: 'US',
            name: 'United States of America',
          ),
        );
      });
    });
  });
}
