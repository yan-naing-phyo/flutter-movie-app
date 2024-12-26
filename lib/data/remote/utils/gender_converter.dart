import 'package:flutter_movie_app/data/models/person.dart';

class GenderConverter {
  const GenderConverter._();

  static Gender convert(int gender) {
    switch (gender) {
      case 1:
        return Gender.female;
      case 2:
        return Gender.male;
      default:
        return Gender.unknown;
    }
  }
}
