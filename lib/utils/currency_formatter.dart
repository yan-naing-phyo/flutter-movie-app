import 'package:intl/intl.dart';

class CurrencyFormatter {
  const CurrencyFormatter._();

  static String format(int amount) {
    final numberFormat = NumberFormat.currency(symbol: '\u0024');

    return numberFormat.format(amount);
  }
}
