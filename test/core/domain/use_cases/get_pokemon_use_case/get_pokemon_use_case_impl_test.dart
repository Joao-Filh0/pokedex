import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/commons/errors/base_error.dart';
import 'package:pokedex/commons/result_wrapper/result_wrapper.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/core/domain/repositories/pokedex_repository/pokedex_repository.dart';
import 'package:pokedex/core/domain/use_cases/get_pokemon_use_case/get_pokemon_use_case.dart';
import 'package:pokedex/core/domain/use_cases/get_pokemon_use_case/get_pokemon_use_case_impl.dart';

class PokedexRepositoryMock extends Mock implements PokedexRepository {}

void main() {
  late PokedexRepository repository;
  late GetPokemonUseCase useCase;

  setUp(() {
    repository = PokedexRepositoryMock();
    useCase = GetPokemonUseCaseImpl(repository);
  });
  group('[DOMAIN] - GetPokemonUseCase', () {
    test('When repository return success ', () async {
      when(() => repository.getPoke()).thenAnswer(
        (_) async => ResultSuccess<List<PokeEntity>>([]),
      );

      final result = await useCase();
      expect(result.isSuccess, true);
    });

    test('When repository return  error ', () async {
      when(() => repository.getPoke())
          .thenAnswer((_) async => ResultError(BaseError('error')));

      final result = await useCase();
      expect(result.isError, true);
      expect(result.errorData.message, 'error');
    });
  });
}
