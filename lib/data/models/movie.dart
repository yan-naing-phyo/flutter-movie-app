import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  const Movie({
    required this.backdropImageUrl,
    required this.id,
    required this.overview,
    required this.popularity,
    required this.posterImageUrl,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  final String backdropImageUrl;
  final int id;
  final String overview;
  final double popularity;
  final String posterImageUrl;
  final DateTime? releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  int? get releaseYear => releaseDate?.year;

  @override
  List<Object?> get props => [
        backdropImageUrl,
        id,
        overview,
        popularity,
        posterImageUrl,
        releaseDate,
        title,
        voteAverage,
        voteCount
      ];
}
