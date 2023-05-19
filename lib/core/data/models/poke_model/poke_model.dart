import "package:pokedex/core/domain/entities/poke_entity.dart";

class PokeModel extends PokeEntity {
  const PokeModel(
      {required super.name,
      required super.types,
      required super.abilities,
      required super.image,
      required super.weight,
      required super.height,
      required super.id,
      required super.hp,
      required super.atk,
      required super.def,
      required super.satk,
      required super.sdef,
      required super.spd});

  factory PokeModel.fromMap(Map<String, dynamic> map) {
    final List<String> listTypes = map["types"]
        .map<String>((type) => (type["type"]["name"] as String))
        .toList();
    final List<String> listAbilities = map["abilities"]
        .map<String>((ability) => (ability["ability"]["name"] as String))
        .toList();
    final String image =
        map["sprites"]["other"]["official-artwork"]["front_default"];
    return PokeModel(
      id: map["id"],
      name: map["name"],
      types: listTypes,
      abilities: listAbilities,
      image: image,
      weight: map["weight"] / 10,
      height: map["height"] / 10,
      hp: map['stats'][0]["base_stat"] / 100,
      atk: map['stats'][1]["base_stat"] / 100,
      def: map['stats'][2]["base_stat"] / 100,
      satk: map['stats'][3]["base_stat"] / 100,
      sdef: map['stats'][4]["base_stat"] / 100,
      spd: map['stats'][5]["base_stat"] / 100,
    );
  }
}
