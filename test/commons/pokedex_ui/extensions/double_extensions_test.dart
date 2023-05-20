import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/commons/pokedex_ui/extensions/double_extensions.dart';

void main() {
  group('[COMMONS/POKEDEXUI] - DoubleToString', () {
    test('should return 5,6', () {
      const double value = 5.6;
      final String result = value.doubleToString();

      expect(result, "5,6");
    });

    test('should return 100,02', () {
      const double value = 100.02;
      final String result = value.doubleToString();

      expect(result, "100,02");
    });
  });
}
