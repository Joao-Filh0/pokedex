import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/commons/pokedex_ui/extensions/string_extensions.dart';

void main() {
  group('[COMMONS/POKEDEXUI] - Capitalize', () {
    test('should return first letter upperCase', () {
      const String text = "flutter";
      final String result = text.capitalize();

      expect(result, "Flutter");
    });
  });
}
