import 'person.dart';

class Cast extends Person {
  const Cast({
    required super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.popularity,
    required super.profileImageUrl,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  final int castId;
  final String character;
  final String creditId;
  final int order;

  @override
  List<Object?> get props => [
        gender,
        id,
        knownForDepartment,
        name,
        popularity,
        profileImageUrl,
        castId,
        character,
        creditId,
        order
      ];
}
