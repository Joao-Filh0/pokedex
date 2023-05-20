import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_filter_button.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_input_field.dart';
import 'package:pokedex/commons/states/bloc_states.dart';
import 'package:pokedex/core/data/models/poke_model/poke_model.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/presentation/pages/home_page/blocs/get_pokemon_bloc.dart';
import 'package:pokedex/presentation/pages/home_page/components/error_home_component.dart';
import 'package:pokedex/presentation/pages/home_page/components/loading_home_component.dart';
import 'package:pokedex/presentation/pages/home_page/components/pokedex_card_component.dart';
import 'package:pokedex/presentation/pages/home_page/home_page.dart';

import '../../../test/presentation/run_test_widget.dart';
import '../../data_mock.dart';

class GetPokemonBlocMock extends Mock implements GetPokemonBloc {}

main() {
  GetPokemonBloc blocMock = GetPokemonBlocMock();
  late List<PokeEntity> entities;
  setUp(() {
    initModule(AppModule(), replaceBinds: [
      Bind.instance<GetPokemonBloc>(blocMock),
    ]);

    entities = dataIntegrationListMocks
        .map<PokeEntity>((map) => PokeModel.fromMap(map))
        .toList();
  });

  testWidgets(
    '[PRESENTATION] HomePage',
    (tester) async {
      when(() => blocMock()).thenAnswer((_) async => () {});
      whenListen(
        blocMock,
        Stream<BaseState>.fromIterable([
          const LoadingState(),
          SuccessState<List<PokeEntity>>(entities),
        ]),
        initialState: EmptyState(),
      );

      await tester.pumpWidget(
        runPageTest(
          const HomePage(
            key: Key('HomePage'),
          ),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.pumpAndSettle(const Duration(seconds: 10));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.drag(
          find.byType(PokedexCardComponent).at(8), const Offset(200, -1000));
      await tester.pumpAndSettle(const Duration(seconds: 20));

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(PokedexInputField), findsOneWidget);
      expect(find.byType(PokedexFilterButton), findsOneWidget);
      expect(find.byType(LoadingHomeComponent), findsNothing);
      expect(find.byType(ErrorHomeComponent), findsNothing);
    },
  );
}
