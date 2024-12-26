const _imageBaseUrl = 'https://image.tmdb.org/t/p/';

const _backdropImageSize = 'w1280';
const _posterImageSize = 'w780';
const _profileImageSize = 'h632';

class ImageUrlBuilder {
  const ImageUrlBuilder._();

  static String? buildBackdropImageUrl(String backdropPath) {
    if (backdropPath.isEmpty) return null;

    return _imageBaseUrl + _backdropImageSize + backdropPath;
  }

  static String? buildPosterImageUrl(String posterPath) {
    if (posterPath.isEmpty) return null;

    return _imageBaseUrl + _posterImageSize + posterPath;
  }

  static String? buildProfileImageUrl(String profilePath) {
    if (profilePath.isEmpty) return null;

    return _imageBaseUrl + _profileImageSize + profilePath;
  }
}
