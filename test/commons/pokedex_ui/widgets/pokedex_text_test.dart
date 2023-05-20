import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';

import '../../../presentation/run_test_widget.dart';

void main() {
  testWidgets('[COMMONS/POKEDEXUI] PokedexText', (WidgetTester tester) async {
    const text = "Flutter Pokedex";
    await tester.pumpWidget(runWidgetTest(const Center(
      child: PokedexText(
        text: text,
      ),
    )));

    expect(find.text(text), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });
}
