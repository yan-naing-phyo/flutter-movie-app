import 'package:equatable/equatable.dart';

class TvShow extends Equatable {
  const TvShow({
    required this.backdropImageUrl,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterImageUrl,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final String backdropImageUrl;
  final int id;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterImageUrl;
  final String firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        backdropImageUrl,
        id,
        originalName,
        overview,
        popularity,
        posterImageUrl,
        firstAirDate,
        name,
        voteAverage,
        voteCount
      ];
}
