import 'package:flutter/painting.dart';

import '../enums/pokedex_types_enum.dart';

class AppColors {
  static Color primary = const Color(0xFFDC0A2D);
  static Color light = const Color(0xFFFFFFFF);
  static Color neutral = const Color(0xFF666666);
  static Color shadow = const Color(0xFFEFEFEF);

  //Pokedex Colors
  static Color normal = const Color(0xFFAAA67F);
  static Color fighting = const Color(0xFFC12239);
  static Color flying = const Color(0xFFA891EC);
  static Color ground = const Color(0xFFDEC16B);
  static Color poison = const Color(0xFFA43E9E);
  static Color rock = const Color(0xFFB69E31);
  static Color bug = const Color(0xFFA7B723);
  static Color ghost = const Color(0xFF70559B);
  static Color steel = const Color(0xFFB7B9D0);
  static Color fire = const Color(0xFFF57D31);
  static Color water = const Color(0xFF6493EB);
  static Color grass = const Color(0xFF74CB48);
  static Color electric = const Color(0xFFF9CF30);
  static Color psychic = const Color(0xFFFB5584);
  static Color ice = const Color(0xFF9AD6DF);
  static Color dragon = const Color(0xFF7037FF);
  static Color dark = const Color(0xFF75574C);
  static Color fairy = const Color(0xFFE69EAC);

  static Color getColorForType(PokedexTypesEnum type) {
    switch (type) {
      case PokedexTypesEnum.normal:
        return normal;
      case PokedexTypesEnum.fire:
        return fire;
      case PokedexTypesEnum.water:
        return water;
      case PokedexTypesEnum.electric:
        return electric;
      case PokedexTypesEnum.grass:
        return grass;
      case PokedexTypesEnum.ice:
        return ice;
      case PokedexTypesEnum.fighting:
        return fighting;
      case PokedexTypesEnum.poison:
        return poison;
      case PokedexTypesEnum.ground:
        return ground;
      case PokedexTypesEnum.flying:
        return flying;
      case PokedexTypesEnum.psychic:
        return psychic;
      case PokedexTypesEnum.bug:
        return bug;
      case PokedexTypesEnum.rock:
        return rock;
      case PokedexTypesEnum.ghost:
        return ghost;
      case PokedexTypesEnum.dragon:
        return dragon;
      case PokedexTypesEnum.dark:
        return dark;
      case PokedexTypesEnum.steel:
        return steel;
      case PokedexTypesEnum.fairy:
        return fairy;
    }
  }
}
