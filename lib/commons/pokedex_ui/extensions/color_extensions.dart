import 'package:flutter/material.dart';

extension LightColor on Color {
  light([double amount = .3]) {
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0).toDouble();

    return hsl.withLightness(lightness).toColor();
  }
}
