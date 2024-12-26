import 'package:flutter_movie_app/utils/decimal_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DecimalUtil', () {
    group('FractionDigits ', () {
      test('convert double to correct fraction digits', () {
        expect(1.666.toStringWithFraction(1), '1.6');
        expect(1.777.toStringWithFraction(2), '1.77');
      });
    });
  });
}
