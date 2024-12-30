import 'package:equatable/equatable.dart';

class DbMovie extends Equatable {
  const DbMovie({
    required this.backdropImageUrl,
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
    required this.posterImageUrl,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  final String backdropImageUrl;
  final int budget;
  final String genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterImageUrl;
  final String productionCompanies;
  final String productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final double voteAverage;
  final int voteCount;

  factory DbMovie.fromMap(Map<String, dynamic> json) => DbMovie(
        backdropImageUrl: json['backdropImageUrl'],
        budget: json['budget'],
        genres: json['genres'],
        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdbId'],
        originCountry: json['originCountry'],
        originalLanguage: json['originalLanguage'],
        originalTitle: json['originalTitle'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterImageUrl: json['posterImageUrl'],
        productionCompanies: json['productionCompanies'],
        productionCountries: json['productionCountries'],
        releaseDate: json['releaseDate'],
        revenue: json['revenue'],
        runtime: json['runtime'],
        spokenLanguages: json['spokenLanguages'],
        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        voteAverage: json['voteAverage'],
        voteCount: json['voteCount'],
      );

  Map<String, dynamic> toMap() => {
        'backdropImageUrl': backdropImageUrl,
        'budget': budget,
        'genres': genres,
        'homepage': homepage,
        'id': id,
        'imdbId': imdbId,
        'originCountry': originCountry,
        'originalLanguage': originalLanguage,
        'originalTitle': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'posterImageUrl': posterImageUrl,
        'productionCompanies': productionCompanies,
        'productionCountries': productionCountries,
        'releaseDate': releaseDate,
        'revenue': revenue,
        'runtime': runtime,
        'spokenLanguages': spokenLanguages,
        'status': status,
        'tagline': tagline,
        'title': title,
        'voteAverage': voteAverage,
        'voteCount': voteCount,
      };

  @override
  List<Object?> get props => [
        backdropImageUrl,
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
        posterImageUrl,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        voteAverage,
        voteCount,
      ];
}
