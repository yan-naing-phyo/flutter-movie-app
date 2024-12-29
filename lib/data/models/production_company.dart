import 'package:equatable/equatable.dart';

class ProductionCompany extends Equatable {
  const ProductionCompany({
    required this.id,
    required this.logoImageUrl,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoImageUrl;
  final String name;
  final String originCountry;

  @override
  List<Object?> get props => [id, logoImageUrl, name, originCountry];
}
