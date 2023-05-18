import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../enums/pokedex_icons_enum.dart';

class PokedexIcon extends StatelessWidget {
  static const String _iconsAssetsPath = 'assets/icons/';
  final PokedexIconsEnum icon;
  final double width;
  final double height;
  final bool branded;
  final Color? color;

  const PokedexIcon(
      {required this.icon,
      Key? key,
      this.width = 48,
      this.height = 48,
      this.branded = false})
      : color = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      '$_iconsAssetsPath${icon.name}.svg',
      colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
      width: width,
      height: height,
    );
  }
}
