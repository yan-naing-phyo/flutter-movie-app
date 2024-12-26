import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/remote/utils/gender_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GenderConverter', () {
    group('convert', () {
      test('returns Female when gender is 1', () {
        expect(GenderConverter.convert(1), Gender.female);
      });

      test('returns Male when gender is 2', () {
        expect(GenderConverter.convert(2), Gender.male);
      });

      test('returns Unknown when gender is unknown', () {
        expect(GenderConverter.convert(0), Gender.unknown);
        expect(GenderConverter.convert(4), Gender.unknown);
      });
    });
  });
}
