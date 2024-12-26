import 'package:equatable/equatable.dart';

enum Gender { unknown, female, male }

class Person extends Equatable {
  const Person({
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    required this.profileImageUrl,
  });

  final Gender gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final double popularity;
  final String profileImageUrl;

  @override
  List<Object?> get props => [
        gender,
        id,
        knownForDepartment,
        name,
        popularity,
        profileImageUrl,
      ];
}
