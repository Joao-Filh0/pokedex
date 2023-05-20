import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_types_enum.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';

void main() {
  group('[COMMONS/POKEDEXUI] - AppColors getColorForType', () {
    test('should return Color of type water', () {
      final result = AppColors.getColorForType(PokedexTypesEnum.water);

      expect(result, AppColors.water);
    });
  });
}
