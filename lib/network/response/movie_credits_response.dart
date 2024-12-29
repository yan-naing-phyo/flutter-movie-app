import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/network/models/models.dart';

class MovieCreditsResponse extends Equatable {
  const MovieCreditsResponse({
    required this.id,
    required this.cast,
  });

  final int id;
  final List<ApiCast> cast;

  factory MovieCreditsResponse.fromJson(Map<String, dynamic> json) {
    return MovieCreditsResponse(
      id: json['id'] as int? ?? 0,
      cast: (json['cast'] as List? ?? [])
          .map(
            (e) => ApiCast.fromJson(e),
          )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [id, cast];
}
