import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';
import 'package:pokedex/core/data/models/poke_model/poke_model.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/presentation/pages/details_page/components/pokemon_images_component.dart';
import 'package:pokedex/presentation/pages/details_page/details_page.dart';

import '../../../test/presentation/run_test_widget.dart';
import '../../data_mock.dart';

void main() {
  late List<PokeEntity> entities;
  late DetailsPageParams params;
  setUpAll(() {
    entities = dataIntegrationMock
        .map<PokeEntity>((map) => PokeModel.fromMap(map))
        .toList();
    params = DetailsPageParams(pokes: entities, index: 0);
  });

  testWidgets(
    '[PRESENTATION] - DetailsPage',
    (WidgetTester tester) async {
      await tester.pumpWidget(runPageTest(DetailsPage(params: params)));
      final nextButton = find.byKey(const Key("next"));
      final backButton = find.byKey(const Key("back"));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      for (var element in entities) {
        await tester.pumpAndSettle(const Duration(seconds: 2));
        if (element == entities[0]) {
          continue;
        }

        await tester.tap(nextButton);
        await tester.pumpAndSettle(const Duration(seconds: 1));
      }
      for (var element in entities) {
        await tester.pumpAndSettle(const Duration(seconds: 2));
        if (element == entities[0]) {
          continue;
        }

        await tester.tap(backButton);
      }
      await tester.pumpAndSettle(const Duration(seconds: 10));

      expect(find.byType(PokedexText), findsNWidgets(24));
      expect(find.byType(PokemonImagesComponent), findsOneWidget);
    },
  );
}
