import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/models/models.dart';

void main() {
  group('ApiProductionCompany', () {
    group('fromJson', () {
      test('initialize null values with default values', () {
        expect(
          ApiProductionCompany.fromJson({}),
          ApiProductionCompany(
            id: 0,
            logoPath: '',
            name: '',
            originCountry: '',
          ),
        );
      });

      test('initialize with correct values', () {
        final json = {
          "id": 73669,
          "logo_path": "/9JmgzVUNvUN5KhZjmiVHEzPtFCc.png",
          "name": "Seven Bucks Productions",
          "origin_country": "US"
        };

        expect(
          ApiProductionCompany.fromJson(json),
          ApiProductionCompany(
            id: 73669,
            logoPath: '/9JmgzVUNvUN5KhZjmiVHEzPtFCc.png',
            name: 'Seven Bucks Productions',
            originCountry: 'US',
          ),
        );
      });
    });
  });
}
