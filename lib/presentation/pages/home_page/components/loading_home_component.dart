import 'package:flutter/material.dart';
import 'package:pokedex/commons/config/strings.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_animations_enum.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_animation.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';

class LoadingHomeComponent extends StatelessWidget {
  const LoadingHomeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const PokedexAnimation(
            animation: PokedexAnimationsEnum.pokeball,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: PokedexText(
              text: AppString.await,
              isFontFamily: true,
              color: AppColors.primary,
              size: 25.0,
            ),
          )
        ],
      ),
    );
  }
}
