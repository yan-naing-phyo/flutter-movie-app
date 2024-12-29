import 'package:equatable/equatable.dart';

class ApiCast extends Equatable {
  const ApiCast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  factory ApiCast.fromJson(Map<String, dynamic> json) {
    return ApiCast(
      adult: json['adult'] as bool? ?? false,
      gender: json['gender'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      knownForDepartment: json['known_for_department'] as String? ?? '',
      name: json['name'] as String? ?? '',
      originalName: json['original_name'] as String? ?? '',
      popularity: (json['popularity'] as num? ?? 0.0).toDouble(),
      profilePath: json['profile_path'] as String? ?? '',
      castId: json['cast_id'] as int? ?? 0,
      character: json['character'] as String? ?? '',
      creditId: json['credit_id'] as String? ?? '',
      order: json['order'] as int? ?? 0,
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
        profilePath,
        castId,
        character,
        creditId,
        order
      ];
}
