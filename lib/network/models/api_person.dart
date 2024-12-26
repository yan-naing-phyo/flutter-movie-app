import 'package:equatable/equatable.dart';

class ApiPerson extends Equatable {
  const ApiPerson({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
  });

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;

  factory ApiPerson.fromJson(Map<String, dynamic> json) {
    return ApiPerson(
      adult: json['adult'] as bool? ?? false,
      gender: json['gender'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      knownForDepartment: json['known_for_department'] as String? ?? '',
      name: json['name'] as String? ?? '',
      originalName: json['original_name'] as String? ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      profilePath: json['profile_path'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath
      ];
}
