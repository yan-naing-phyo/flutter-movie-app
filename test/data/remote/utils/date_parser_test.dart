import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/data/remote/utils/date_parser.dart';

void main() {
  group('DateParser', () {
    group('parse', () {
      test('parse formatted date string', () {
        expect(ApiDateParser.parse('2024-10-31'), DateTime(2024, 10, 31));
      });

      test('returns null when date string is empty', () {
        expect(ApiDateParser.parse(''), isNull);
      });

      test('returns null when date string is invalid', () {
        expect(ApiDateParser.parse('dateString'), isNull);
      });
    });
  });
}
