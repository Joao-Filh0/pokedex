import 'package:pokedex/commons/config/urls.dart';
import 'package:pokedex/commons/http_client/http_client.dart';
import 'package:pokedex/core/data/datasources/pokedex_datasource/pokedex_datasource.dart';
import 'package:pokedex/core/data/models/poke_urls_model/poke_urls_model.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/core/domain/entities/poke_urls_entity.dart';

import '../../models/poke_model/poke_model.dart';

class PokedexDataSourceImpl implements PokedexDataSource {
  final HttpAppClient _client;

  PokedexDataSourceImpl(this._client);

  @override
  Future<PokeEntity> getPokeInfo(String url) async {
    final response = await _client.get(url);
    final data = (response.data as Map<String, dynamic>);
    return PokeModel.fromMap(data);
  }

  @override
  Future<PokeUrlsEntity> getPokeUrl() async {
    final response = await _client.get('${AppUrls.pokedex}/pokemon',
        queryParameters: {"limit": "18", "offset": "7"});
    final data = (response.data as Map<String, dynamic>);
    return PokeUrlsModel.fromMap(data);
  }
}
