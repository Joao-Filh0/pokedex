import 'package:pokedex/commons/result_wrapper/result_wrapper.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';

abstract class GetPokemonUseCase {
  Future<Result<List<PokeEntity>>> call();
}
