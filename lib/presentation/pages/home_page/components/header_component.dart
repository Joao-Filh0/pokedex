import 'package:flutter/material.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_icon.dart';

class HeaderComponent extends StatelessWidget {
  final double size;

  const HeaderComponent({Key? key, this.size = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PokedexIcon(
          icon: PokedexIconsEnum.pokeball,
          color: AppColors.light,
          size: size,
        ),
        const SizedBox(
          width: 20.0,
        ),
        PokedexIcon(
          icon: PokedexIconsEnum.pokedex,
          color: AppColors.light,
          size: size,
        )
      ],
    );
  }
}
