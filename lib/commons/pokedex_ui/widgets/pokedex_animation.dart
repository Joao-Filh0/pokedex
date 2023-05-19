import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_animations_enum.dart';

class PokedexAnimation extends StatelessWidget {
  static const _assetsJsonPath = 'assets/json/';
  final PokedexAnimationsEnum animation;
  final double size;

  const PokedexAnimation({Key? key, required this.animation, this.size = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: Lottie.asset('$_assetsJsonPath${animation.name}.json'));
  }
}
