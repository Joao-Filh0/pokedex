import 'package:flutter/material.dart';
import 'package:pokedex/commons/config/strings.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_animations_enum.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_animation.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_button.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';

class ErrorHomeComponent extends StatelessWidget {
  final String message;
  final VoidCallback? onPressed;

  const ErrorHomeComponent({Key? key, required this.message, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PokedexAnimation(
            animation: PokedexAnimationsEnum.swablu,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, bottom: 20.0, left: 30.0, right: 30.0),
            child: PokedexText(
              text: AppString.errorMessage,
              isFontFamily: true,
              color: AppColors.primary,
              size: 25.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: PokedexText(
              text: message,
            ),
          ),
          PokedexButton(
            text: AppString.tryAgain,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
