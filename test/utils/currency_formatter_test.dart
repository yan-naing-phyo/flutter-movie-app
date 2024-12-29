import 'package:flutter_movie_app/utils/currency_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyFormatter', () {
    test('format currency amount in correct pattern', () {
      expect(CurrencyFormatter.format(310000000), '\u0024310,000,000.00');
    });
  });
}
