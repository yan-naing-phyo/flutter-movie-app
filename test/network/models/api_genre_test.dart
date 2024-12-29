import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/models/models.dart';

void main() {
  group('ApiGenre', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(ApiGenre.fromJson({}), ApiGenre(id: 0, name: ''));
      });

      test('initialize with correct values', () {
        final json = {"id": 28, "name": "Action"};

        expect(
          ApiGenre.fromJson(json),
          ApiGenre(id: 28, name: 'Action'),
        );
      });
    });
  });
}
