import 'package:pokedex/commons/result_wrapper/result_wrapper.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/core/domain/repositories/pokedex_repository/pokedex_repository.dart';
import 'package:pokedex/core/domain/use_cases/get_pokemon_use_case/get_pokemon_use_case.dart';

class GetPokemonUseCaseImpl implements GetPokemonUseCase {
  final PokedexRepository repository;

  GetPokemonUseCaseImpl(this.repository);

  @override
  Future<Result<List<PokeEntity>>> call() => repository.getPoke();
}
