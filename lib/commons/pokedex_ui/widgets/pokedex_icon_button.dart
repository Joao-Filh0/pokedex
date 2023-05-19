import 'package:flutter/material.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_icon.dart';

class PokedexIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool visible;
  final PokedexIconsEnum icon;

  const PokedexIconButton(
      {Key? key, this.onTap, required this.visible, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PokedexIcon(
            icon: icon,
            size: 13.43,
            color: AppColors.light,
          ),
        ),
      ),
    );
  }
}
