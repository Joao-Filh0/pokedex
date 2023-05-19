import '../enums/pokedex_types_enum.dart';

PokedexTypesEnum selectPokedexTypeByString(String type) {
  final pokedexType =
      PokedexTypesEnum.values.where((element) => element.name == type);
  return pokedexType.first;
}
