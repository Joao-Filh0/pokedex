import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/commons/pokedex_ui/extensions/string_extensions.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_icon.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';

class HeaderTitleComponent extends StatelessWidget {
  final String name;

  const HeaderTitleComponent({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                size: size.height * 0.03,
                color: AppColors.light,
              ),
            ),
            SizedBox(
              width: size.height * 0.02,
            ),
            PokedexText(
              text: name.capitalize(),
              isFontFamily: true,
              size: size.height * 0.04,
              color: AppColors.light,
            )
          ],
        ),
      ),
    );
  }
}
