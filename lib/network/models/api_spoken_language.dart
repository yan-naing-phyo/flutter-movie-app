import 'package:equatable/equatable.dart';

class ApiSpokenLanguage extends Equatable {
  const ApiSpokenLanguage({
    required this.englishName,
    required this.iso_639_1,
    required this.name,
  });

  final String englishName;
  final String iso_639_1;
  final String name;

  factory ApiSpokenLanguage.fromJson(Map<String, dynamic> json) {
    return ApiSpokenLanguage(
      englishName: json['english_name'] as String? ?? '',
      iso_639_1: json['iso_639_1'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [englishName, iso_639_1, name];
}
