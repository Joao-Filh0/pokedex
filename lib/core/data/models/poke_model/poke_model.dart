import "package:pokedex/core/domain/entities/poke_entity.dart";

class PokeModel extends PokeEntity {
  const PokeModel({required super.name,
    required super.types,
    required super.abilities,
    required super.image,
    required super.weight,
    required super.height,
    required super.id});

  factory PokeModel.fromMap(Map<String, dynamic> map) {
    final List<String> listTypes = map["types"]
        .map<String>((type) => (type["type"]["name"] as String))
        .toList();
    final List<String> listAbilities = map["abilities"]
        .map<String>((ability) => (ability["ability"]["name"] as String))
        .toList();
    final String image = map["sprites"]["other"]["official-artwork"]["front_default"];
    return PokeModel(
      id: map["id"],
      name: map["name"],
      types: listTypes,
      abilities: listAbilities,
      image: image,
      weight: map["weight"] / 10,

      height: map["height"] / 10,
    );
  }
}
