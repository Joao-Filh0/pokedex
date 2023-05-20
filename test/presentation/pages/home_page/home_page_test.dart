import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
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

import '../../../core/data/data_mock.dart';
import '../../run_test_widget.dart';

class GetPokemonBlocMock extends Mock implements GetPokemonBloc {}

main() {
  GetPokemonBloc blocMock = GetPokemonBlocMock();
  late PokeEntity entity;
  late List<PokeEntity> listEntity;
  setUp(() {
    initModule(AppModule(), replaceBinds: [
      Bind.instance<GetPokemonBloc>(blocMock),
    ]);

    entity = PokeModel.fromMap(pokeDataMock);
    listEntity = [entity, entity, entity];
  });

  group('[PRESENTATION] - HomePage', () {
    testWidgets(
      'LoadingState',
      (tester) async {
        when(() => blocMock()).thenAnswer((_) async => () {});
        whenListen(
          blocMock,
          Stream<BaseState>.fromIterable([
            const LoadingState(),
          ]),
          initialState: const LoadingState(),
        );

        await tester.pumpWidget(
          runPageTest(
            const HomePage(
              key: Key('HomePage'),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(LoadingHomeComponent), findsOneWidget);
      },
    );

    testWidgets(
      'ErrorState',
      (tester) async {
        when(() => blocMock()).thenAnswer((_) async => () {});
        whenListen(
          blocMock,
          Stream<BaseState>.fromIterable([
            const ErrorState('Error'),
          ]),
          initialState: const ErrorState('Error'),
        );

        await tester.pumpWidget(
          runPageTest(
            const HomePage(
              key: Key('HomePage'),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(ErrorHomeComponent), findsOneWidget);
      },
    );

    testWidgets(
      'EmptyState',
      (tester) async {
        when(() => blocMock()).thenAnswer((_) async => () {});
        whenListen(
          blocMock,
          Stream<BaseState>.fromIterable([
            EmptyState(),
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

        await tester.pump();

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(LoadingHomeComponent), findsOneWidget);
      },
    );
    testWidgets(
      'SuccessState',
      (tester) async {
        when(() => blocMock()).thenAnswer((_) async => () {});
        whenListen(
          blocMock,
          Stream<BaseState>.fromIterable([
            SuccessState<List<PokeEntity>>(listEntity),
          ]),
          initialState: EmptyState(),
        );

        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(
            runPageTest(
              const HomePage(
                key: Key('HomePage'),
              ),
            ),
          );

          await tester.pump();

          expect(find.byType(Scaffold), findsOneWidget);
          expect(find.byType(PokedexInputField), findsOneWidget);
          expect(find.byType(PokedexFilterButton), findsOneWidget);
          expect(find.byType(LoadingHomeComponent), findsNothing);
          expect(find.byType(ErrorHomeComponent), findsNothing);
          expect(find.byType(PokedexCardComponent), findsNWidgets(3));
        });
      },
    );
  });
}
