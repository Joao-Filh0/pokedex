import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_types_enum.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_tag.dart';

import '../../../presentation/run_test_widget.dart';

void main() {
  testWidgets('[COMMONS/POKEDEXUI] PokedexTag', (WidgetTester tester) async {
    await tester.pumpWidget(runWidgetTest(Column(
      children: List<Widget>.generate(
          5,
          (index) => PokedexTag(
                type: PokedexTypesEnum.values[index],
              )),
    )));

    final redWidgetFinder = find.byType(Text);
    final redWidget = tester.widget<Text>(redWidgetFinder.last);

    expect(redWidget.style?.color, const Color(0xffffffff));

    expect(find.byType(Text), findsNWidgets(5));
    expect(find.byType(PokedexTag), findsNWidgets(5));
  });
}
