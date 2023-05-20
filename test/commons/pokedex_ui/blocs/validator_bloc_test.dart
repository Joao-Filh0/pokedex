import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/commons/pokedex_ui/blocs/validator_bloc.dart';

void main() {
  final ValidatorBloc<bool> bloc = ValidatorBloc(false);

  group('[COMMONS/POKEDEXUI] - ValidatorBloc', () {
    blocTest<ValidatorBloc<bool>, bool>(
      'should return  boolean ',
      build: () => bloc,
      act: ((bloc) => bloc(true)),
      expect: () => [isA<bool>()],
    );
  });
}
