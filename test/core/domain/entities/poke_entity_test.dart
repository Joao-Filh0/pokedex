import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';

void main() {
  const poke = PokeEntity(
    id: 1,
    name: "Bulbasaur",
    types: ["Grass", "Poison"],
    abilities: ["Overgrow", "Chlorophyll"],
    image: "image_url",
    weight: 6.9,
    height: 0.7,
    hp: 45,
    atk: 49,
    def: 49,
    satk: 65,
    sdef: 65,
    spd: 45,
  );

  test('[DOMAIN] - Bulbasaur', () {
    expect(poke.id, 1);
    expect(poke.name, "Bulbasaur");
    expect(poke.types, ["Grass", "Poison"]);
    assert(poke.props.contains(poke.name), "props contains name ");
  });
}
