import 'package:equatable/equatable.dart';

class ApiGenre extends Equatable {
  const ApiGenre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory ApiGenre.fromJson(Map<String, dynamic> json) {
    return ApiGenre(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}
