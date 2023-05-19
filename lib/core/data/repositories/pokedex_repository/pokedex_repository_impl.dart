import 'package:pokedex/commons/errors/base_error.dart';
import 'package:pokedex/commons/result_wrapper/result_wrapper.dart';
import 'package:pokedex/core/data/datasources/pokedex_datasource/pokedex_datasource.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/core/domain/repositories/pokedex_repository/pokedex_repository.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final PokedexDataSource _datasource;

  PokedexRepositoryImpl(this._datasource);

  @override
  Future<Result<List<PokeEntity>>> getPoke() async {
    try {
      List<PokeEntity> pokes = [];
      final result = await _datasource.getPokeUrl();
      for (var url in result.urls) {
        final poke = await _datasource.getPokeInfo(url);
        pokes.add(poke);
      }
      return ResultSuccess<List<PokeEntity>>(pokes);
    } catch (e) {
      return ResultError(BaseError(e.toString()));
    }
  }
}
