import 'package:equatable/equatable.dart';

class ApiProductionCountry extends Equatable {
  const ApiProductionCountry({
    required this.iso_3166_1,
    required this.name,
  });

  final String iso_3166_1;
  final String name;

  factory ApiProductionCountry.fromJson(Map<String, dynamic> json) {
    return ApiProductionCountry(
      iso_3166_1: json['iso_3166_1'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [iso_3166_1, name];
}
