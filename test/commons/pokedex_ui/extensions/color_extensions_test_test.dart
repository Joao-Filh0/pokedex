import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/commons/pokedex_ui/extensions/color_extensions.dart';

void main() {
  group('[COMMONS/POKEDEXUI] - LightColor', () {
    test('should lighten the color', () {
      const color = Color(0xFF000000);
      final lightColor = color.light();

      expect(lightColor, const Color(0xff990000));
    });

    test('Increase brightness in 50%', () {
      const color = Color(0xFF000000);
      final lightColor = color.light(0.5);

      expect(lightColor, const Color(0xffff0000));
    });

    test('Must not exceed maximum light', () {
      const color = Color(0xFFFFFFFF);
      final lightColor = color.light();

      expect(lightColor, const Color(0xFFFFFFFF));
    });
  });
}
