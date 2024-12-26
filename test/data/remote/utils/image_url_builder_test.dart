import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/data/remote/utils/image_url_builder.dart';

void main() {
  group('ImageUrlBuilder', () {
    group('buildBackdropImageUrl', () {
      test('returns null when backdropPath is empty', () {
        expect(ImageUrlBuilder.buildBackdropImageUrl(''), isNull);
      });

      test('returns backdrop image url when backdropPath is not empty', () {
        expect(
          ImageUrlBuilder.buildBackdropImageUrl('backdropPath'),
          isNotNull,
        );
      });
    });

    group('buildPosterImageUrl', () {
      test('returns null when posterPath is empty', () {
        expect(ImageUrlBuilder.buildPosterImageUrl(''), isNull);
      });

      test('returns poster image url when posterPath is not empty', () {
        expect(
          ImageUrlBuilder.buildPosterImageUrl('posterPath'),
          isNotNull,
        );
      });
    });

    group('buildProfileImageUrl', () {
      test('returns null when profilePath is empty', () {
        expect(ImageUrlBuilder.buildProfileImageUrl(''), isNull);
      });

      test('returns profile image url when profilePath is not empty', () {
        expect(
          ImageUrlBuilder.buildProfileImageUrl('profilePath'),
          isNotNull,
        );
      });
    });
  });
}
