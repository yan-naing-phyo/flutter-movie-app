import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/utils/runtime_util.dart';

void main() {
  group('RuntimeUtil', () {
    test('convert `runtime` in minutes to correct string', () {
      expect(RuntimeUtil.runtimeString(150), '2h 30m');
    });
  });
}
