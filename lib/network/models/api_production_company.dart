import 'package:equatable/equatable.dart';

class ApiProductionCompany extends Equatable {
  const ApiProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  factory ApiProductionCompany.fromJson(Map<String, dynamic> json) {
    return ApiProductionCompany(
      id: json['id'] as int? ?? 0,
      logoPath: json['logo_path'] as String? ?? '',
      name: json['name'] as String? ?? '',
      originCountry: json['origin_country'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];
}
