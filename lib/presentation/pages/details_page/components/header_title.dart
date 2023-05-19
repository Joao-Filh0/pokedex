import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_icon.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';

class HeaderTitle extends StatelessWidget {
  final String tag;

  const HeaderTitle({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 29.93, top: 24.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Modular.to.pop();
              },
              child: PokedexIcon(
                icon: PokedexIconsEnum.back,
                size: 25.0,
                color: AppColors.light,
              ),
            ),
            const SizedBox(
              width: 13.73,
            ),
            PokedexText(
              text: tag,
              isFontFamily: true,
              size: 32,
              color: AppColors.light,
            )
          ],
        ),
      ),
    );
  }
}
