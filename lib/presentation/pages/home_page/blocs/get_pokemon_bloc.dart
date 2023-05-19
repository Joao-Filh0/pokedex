import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/core/domain/use_cases/get_pokemon_use_case/get_pokemon_use_case.dart';
import 'package:pokedex/utils/states/bloc_states.dart';

class GetPokemonBloc extends Cubit<BaseState> {
  final GetPokemonUseCase _useCase;

  GetPokemonBloc(this._useCase) : super(EmptyState());

  Future<void> call() async {
    emit(const LoadingState());
    final result = await _useCase();

    if (result.isSuccess) {
      emit(SuccessState<List<PokeEntity>>(result.successData));
      return;
    }
    emit(ErrorState(result.errorData.message));
  }
}
