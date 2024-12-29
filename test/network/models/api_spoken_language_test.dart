import 'package:flutter_movie_app/network/models/api_spoken_language.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiSpokenLanguage', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          ApiSpokenLanguage.fromJson({}),
          ApiSpokenLanguage(englishName: '', iso_639_1: '', name: ''),
        );
      });

      test('initialize with correct values', () {
        final json = {
          "english_name": "English",
          "iso_639_1": "en",
          "name": "English"
        };

        expect(
          ApiSpokenLanguage.fromJson(json),
          ApiSpokenLanguage(
            englishName: 'English',
            iso_639_1: 'en',
            name: 'English',
          ),
        );
      });
    });
  });
}
