import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/data/models/poke_model/poke_model.dart';

import '../../data_mock.dart';

void main() {
  test('[DATA] - PokeModel', () {
    const expectedModel = PokeModel(
      id: 1,
      name: "pikachu",
      types: ["grass", "poison"],
      abilities: ["Overgrow", "Chlorophyll"],
      image:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
      weight: 6.9,
      height: 0.7,
      hp: 0.45,
      atk: 0.490,
      def: 0.490,
      satk: 0.65,
      sdef: 0.65,
      spd: 0.41,
    );

    final model = PokeModel.fromMap(pokeDataMock);

    expect(model, expectedModel);
  });
}
