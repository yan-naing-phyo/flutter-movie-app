import 'package:equatable/equatable.dart';
import '../models/api_tv_show.dart';

class TvShowListResponse extends Equatable {
  const TvShowListResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<ApiTvShow> results;
  final int totalPages;
  final int totalResults;

  factory TvShowListResponse.fromJson(Map<String, dynamic> json) {
    return TvShowListResponse(
      page: json['page'] as int? ?? 0,
      results: (json['results'] as List? ?? [])
          .map(
            (e) => ApiTvShow.fromJson(e),
          )
          .toList(),
      totalPages: json['total_pages'] as int? ?? 0,
      totalResults: json['total_results'] as int? ?? 0,
    );
  }

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
