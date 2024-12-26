import 'package:equatable/equatable.dart';
import '../models/api_person.dart';

class PersonListResponse extends Equatable {
  const PersonListResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<ApiPerson> results;
  final int totalPages;
  final int totalResults;

  factory PersonListResponse.fromJson(Map<String, dynamic> json) {
    return PersonListResponse(
      page: json['page'] as int? ?? 0,
      results: (json['results'] as List? ?? [])
          .map(
            (e) => ApiPerson.fromJson(e),
          )
          .toList(),
      totalPages: json['total_pages'] as int? ?? 0,
      totalResults: json['total_results'] as int? ?? 0,
    );
  }

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
