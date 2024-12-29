import 'package:equatable/equatable.dart';

class ProductionCountry extends Equatable {
  const ProductionCountry({
    required this.iso_3166_1,
    required this.name,
  });

  final String iso_3166_1;
  final String name;

  @override
  List<Object?> get props => [iso_3166_1, name];
}
