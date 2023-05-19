import 'package:flutter/material.dart';

class _PokedexBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class PokedexScrollConfiguration extends StatelessWidget {
  final Widget? child;

  const PokedexScrollConfiguration({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: _PokedexBehavior(), child: child ?? const SizedBox.shrink());
  }
}
