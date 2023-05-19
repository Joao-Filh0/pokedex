import 'package:pokedex/commons/result_wrapper/result_wrapper.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';

abstract class PokedexRepository {
  Future<Result<List<PokeEntity>>> getPoke();
}
