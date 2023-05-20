import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/data/models/poke_urls_model/poke_urls_model.dart';

import '../../data_mock.dart';

void main() {
  test('[DATA] - PokeUrlsModel', () {
    const expectedModel = PokeUrlsModel([
      "url1",
      "url2",
      "url3",
    ]);

    final model = PokeUrlsModel.fromMap(pokeUrlsDataMock);

    expect(model, expectedModel);
  });
}
