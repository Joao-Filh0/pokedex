import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/utils/result_wrapper/result_wrapper.dart';

abstract class GetPokemonUseCase {
  Future<Result<List<PokeEntity>>> call();
}
