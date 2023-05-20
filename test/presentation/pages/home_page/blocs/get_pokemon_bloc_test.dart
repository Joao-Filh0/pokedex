import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/commons/errors/base_error.dart';
import 'package:pokedex/commons/result_wrapper/result_wrapper.dart';
import 'package:pokedex/commons/states/bloc_states.dart';
import 'package:pokedex/core/domain/use_cases/get_pokemon_use_case/get_pokemon_use_case.dart';
import 'package:pokedex/presentation/pages/home_page/blocs/get_pokemon_bloc.dart';

class GetPokemonUseCaseMock extends Mock implements GetPokemonUseCase {}

main() {
  late GetPokemonUseCase useCase;
  late GetPokemonBloc bloc;

  group('[PRESENTATION] -  GetPokemonBloc', () {
    setUp(() {
      useCase = GetPokemonUseCaseMock();
      bloc = GetPokemonBloc(useCase);
    });

    blocTest<GetPokemonBloc, BaseState>(
      'Bloc Success',
      build: () => bloc,
      act: (bloc) => bloc(),
      setUp: () {
        when(
          () => useCase(),
        ).thenAnswer(
          (_) async => ResultSuccess([]),
        );
      },
      expect: () => [isA<LoadingState>(), isA<SuccessState>()],
    );

    blocTest<GetPokemonBloc, BaseState>(
      'Bloc Error',
      build: () => bloc,
      act: (bloc) => bloc(),
      setUp: () {
        when(
          () => useCase(),
        ).thenAnswer(
          (e) async => ResultError(BaseError(e.toString())),
        );
      },
      expect: () => [isA<LoadingState>(), isA<ErrorState>()],
    );
  });
}
