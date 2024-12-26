import 'package:equatable/equatable.dart';
import '../models/api_movie.dart';

class MovieListResponse extends Equatable {
  const MovieListResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<ApiMovie> results;
  final int totalPages;
  final int totalResults;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    return MovieListResponse(
      page: json['page'] as int? ?? 0,
      results: (json['results'] as List? ?? [])
          .map(
            (e) => ApiMovie.fromJson(e),
          )
          .toList(),
      totalPages: json['total_pages'] as int? ?? 0,
      totalResults: json['total_results'] as int? ?? 0,
    );
  }

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
