import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/domain/entities/poke_urls_entity.dart';

void main() {
  const poke = PokeUrlsEntity(["https://pokemon-mock.com"]);

  test('[DOMAIN] - PokeUrlsEntity', () {
    expect(poke.urls, isA<List<String>>());
    assert(poke.props.isNotEmpty);
  });
}
