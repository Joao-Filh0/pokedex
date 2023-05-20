import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/data/models/poke_model/poke_model.dart';

import '../../data_mock.dart';

void main() {
  test('[DATA] - PokeModel', () {
    const expectedModel = PokeModel(
      id: 1,
      name: "Bulbasaur",
      types: ["grass", "poison"],
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

    final model = PokeModel.fromMap(pokeDataMock);

    expect(model, expectedModel);
  });
}
