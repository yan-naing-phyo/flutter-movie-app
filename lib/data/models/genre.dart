import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  const Genre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
