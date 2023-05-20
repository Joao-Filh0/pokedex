import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';
import 'package:pokedex/core/data/models/poke_model/poke_model.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/presentation/pages/details_page/components/pokemon_images_component.dart';
import 'package:pokedex/presentation/pages/details_page/details_page.dart';

import '../../../core/data/data_mock.dart';
import '../../run_test_widget.dart';

void main() {
  late PokeEntity entity;
  late DetailsPageParams params;
  setUpAll(() {
    entity = PokeModel.fromMap(pokeDataMock);
    params = DetailsPageParams(pokes: [entity, entity, entity], index: 0);
  });

  testWidgets(
    '[PRESENTATION] - DetailsPage',
    (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(runPageTest(DetailsPage(params: params)));
        await tester.pumpAndSettle();

        expect(find.byType(PokedexText), findsNWidgets(25));
        expect(find.byType(PokemonImagesComponent), findsOneWidget);
      });
    },
  );
}
