import 'package:pokedex/core/domain/entities/poke_entity.dart';

import '../../../domain/entities/poke_urls_entity.dart';

abstract class PokedexDataSource {
  Future<PokeUrlsEntity> getPokeUrl();

  Future<PokeEntity> getPokeInfo(String url);
}
