import 'package:equatable/equatable.dart';

import '../models/models.dart';

class MovieDetailsResponse extends Equatable {
  const MovieDetailsResponse({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final int budget;
  final List<ApiGenre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ApiProductionCompany> productionCompanies;
  final List<ApiProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<ApiSpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MovieDetailsResponse(
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String? ?? '',
      budget: json['budget'] as int? ?? 0,
      genres: (json['genres'] as List? ?? [])
          .map(
            (e) => ApiGenre.fromJson(e),
          )
          .toList(),
      homepage: json['homepage'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      imdbId: json['imdb_id'] as String? ?? '',
      originCountry: (json['origin_country'] as List? ?? [])
          .map(
            (e) => e as String,
          )
          .toList(),
      originalLanguage: json['original_language'] as String? ?? '',
      originalTitle: json['original_title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      popularity: (json['popularity'] as num? ?? 0.0).toDouble(),
      posterPath: json['poster_path'] as String? ?? '',
      productionCompanies: (json['production_companies'] as List? ?? [])
          .map(
            (e) => ApiProductionCompany.fromJson(e),
          )
          .toList(),
      productionCountries: (json['production_countries'] as List? ?? [])
          .map(
            (e) => ApiProductionCountry.fromJson(e),
          )
          .toList(),
      releaseDate: json['release_date'] as String? ?? '',
      revenue: json['revenue'] as int? ?? 0,
      runtime: json['runtime'] as int? ?? 0,
      spokenLanguages: (json['spoken_languages'] as List? ?? [])
          .map(
            (e) => ApiSpokenLanguage.fromJson(e),
          )
          .toList(),
      status: json['status'] as String? ?? '',
      tagline: json['tagline'] as String? ?? '',
      title: json['title'] as String? ?? '',
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num? ?? 0.0).toDouble(),
      voteCount: json['vote_count'] as int? ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originCountry,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
