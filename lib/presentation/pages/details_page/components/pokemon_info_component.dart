import 'package:flutter/material.dart';
import 'package:pokedex/commons/config/strings.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/commons/pokedex_ui/extensions/color_extensions.dart';
import 'package:pokedex/commons/pokedex_ui/extensions/double_extensions.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_icon.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';

class PokemonInfoComponent extends StatelessWidget {
  final List<String> abilities;
  final double weight;
  final double height;

  const PokemonInfoComponent(
      {Key? key,
      required this.abilities,
      required this.weight,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _IconInfo(
            value: "${weight.doubleToString()} kg",
            icon: PokedexIconsEnum.weight,
            label: AppString.weight),
        const _CustomDivider(),
        _IconInfo(
          value: "${height.doubleToString()} m",
          icon: PokedexIconsEnum.height,
          label: AppString.height,
        ),
        const _CustomDivider(),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PokedexText(text: abilities.elementAtOrNull(0) ?? ''),
              PokedexText(text: abilities.elementAtOrNull(1) ?? ''),
              const SizedBox(
                height: 13.0,
              ),
              PokedexText(
                text: AppString.moves,
                size: 12,
                color: AppColors.neutral,
              )
            ],
          ),
        )
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: VerticalDivider(
          color: AppColors.neutral.light(0.4),
          thickness: 2,
        ));
  }
}

class _IconInfo extends StatelessWidget {
  final String value;
  final PokedexIconsEnum icon;
  final String label;

  const _IconInfo(
      {Key? key, required this.value, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PokedexIcon(
                icon: icon,
                size: 16.0,
              ),
              const SizedBox(
                width: 12.0,
              ),
              PokedexText(text: value)
            ],
          ),
          const SizedBox(
            height: 23.0,
          ),
          PokedexText(
            text: label,
            size: 12,
            color: AppColors.neutral,
          )
        ],
      ),
    );
  }
}
