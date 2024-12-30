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

  Map<String, dynamic> toMap() => {
        'id': id,
        'logoImageUrl': logoImageUrl,
        'name': name,
        'originCountry': originCountry,
      };

  @override
  List<Object?> get props => [id, logoImageUrl, name, originCountry];
}
