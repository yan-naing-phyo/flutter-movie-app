import 'dart:math';

extension FractionDigits on double {
  String toStringWithFraction(int fractionDigits) {
    final factor = pow(10, fractionDigits);
    final result = (this * factor).truncate() / factor;

    return result.toString();
  }
}
