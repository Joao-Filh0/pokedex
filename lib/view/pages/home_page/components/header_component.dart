import 'package:flutter/material.dart';
import 'package:pokedex/utils/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/utils/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/utils/pokedex_ui/widgets/pokedex_icon.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PokedexIcon(icon: PokedexIconsEnum.pokeball,color: AppColors.background,width: 30.0,height: 30.0,),
        const SizedBox(width: 20.0,),
        PokedexIcon(icon: PokedexIconsEnum.pokedex,color: AppColors.background,width: 30.0,height: 30.0,)
      ],
    );
  }
}
