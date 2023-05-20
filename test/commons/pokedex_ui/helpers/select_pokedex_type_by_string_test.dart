import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_types_enum.dart';
import 'package:pokedex/commons/pokedex_ui/helpers/select_pokedex_type_by_string.dart';

void main() {
  group('[COMMONS/POKEDEXUI] - selectPokedexTypeByString', () {
    test('should return PokedexTypesEnum type electric', () {
      const String text = "electric";
      final result = selectPokedexTypeByString(text);

      expect(result, PokedexTypesEnum.electric);
    });
  });
}
