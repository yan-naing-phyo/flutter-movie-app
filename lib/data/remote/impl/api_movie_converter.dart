import 'package:flutter_movie_app/data/remote/utils/gender_converter.dart';
import 'package:flutter_movie_app/network/models/models.dart';
import 'package:flutter_movie_app/network/response/response.dart';
import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/remote/utils/image_url_builder.dart';
import 'package:flutter_movie_app/data/remote/utils/date_parser.dart';

extension ApiMovieConverter on ApiMovie {
  Movie toDomainMovie() => Movie(
        backdropImageUrl:
            ImageUrlBuilder.buildBackdropImageUrl(backdropPath) ?? '',
        id: id,
        overview: overview,
        popularity: popularity,
        posterImageUrl: ImageUrlBuilder.buildPosterImageUrl(posterPath) ?? '',
        releaseDate: ApiDateParser.parse(releaseDate),
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}

extension ApiMovieListConverter on List<ApiMovie> {
  List<Movie> toDomainMovies() => map(
        (apiMovie) => apiMovie.toDomainMovie(),
      ).toList();
}

extension MovieDetailsResponseConverter on MovieDetailsResponse {
  MovieDetails toDomainMovieDetails() {
    return MovieDetails(
        backdropImageUrl:
            ImageUrlBuilder.buildBackdropImageUrl(backdropPath) ?? '',
        budget: budget,
        genres: genres
            .map(
              (e) => e.toDomainGenre(),
            )
            .toList(),
        homepage: homepage,
        id: id,
        imdbId: imdbId,
        originCountry: originCountry,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterImageUrl: ImageUrlBuilder.buildPosterImageUrl(posterPath) ?? '',
        productionCompanies: productionCompanies
            .map(
              (e) => e.toDomainProductionCompany(),
            )
            .toList(),
        productionCountries: productionCountries
            .map(
              (e) => e.toDomainProductionCountry(),
            )
            .toList(),
        releaseDate: ApiDateParser.parse(releaseDate),
        revenue: revenue,
        runtime: runtime,
        spokenLanguages: spokenLanguages
            .map(
              (e) => e.englishName,
            )
            .toList()
            .join(', '),
        status: status,
        tagline: tagline,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount);
  }
}

extension on ApiGenre {
  Genre toDomainGenre() {
    return Genre(id: id, name: name);
  }
}

extension on ApiProductionCompany {
  ProductionCompany toDomainProductionCompany() {
    return ProductionCompany(
        id: id,
        logoImageUrl: 'logoImageUrl',
        name: name,
        originCountry: originCountry);
  }
}

extension on ApiProductionCountry {
  ProductionCountry toDomainProductionCountry() {
    return ProductionCountry(iso_3166_1: iso_3166_1, name: name);
  }
}

extension ApiCastConverter on ApiCast {
  Cast toDomainCast() => Cast(
        gender: GenderConverter.convert(gender),
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        popularity: popularity,
        profileImageUrl:
            ImageUrlBuilder.buildProfileImageUrl(profilePath) ?? '',
        castId: castId,
        character: character,
        creditId: creditId,
        order: order,
      );
}
