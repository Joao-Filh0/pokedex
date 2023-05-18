import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';

void main() {
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppStart(),
    ),
  );
}
