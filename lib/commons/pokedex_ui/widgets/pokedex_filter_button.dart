import 'package:flutter/material.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_icon.dart';

class PokedexFilterButton extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;

  const PokedexFilterButton({Key? key, this.size = 45, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.light),
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: BorderSide(color: AppColors.light, width: 2),
            ),
          ),
        ),
        onPressed: onTap,
        child: const PokedexIcon(icon: PokedexIconsEnum.filter),
      ),
    );
  }
}
