import 'package:flutter/material.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_types_enum.dart';
import 'package:pokedex/commons/pokedex_ui/extensions/color_extensions.dart';
import 'package:pokedex/commons/pokedex_ui/helpers/select_pokedex_type_by_string.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_icon.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/presentation/pages/details_page/components/header_title.dart';
import 'package:pokedex/presentation/pages/details_page/components/pokemon_images.dart';
import 'components/card_body.dart';

class DetailsPageParams {
  final List<PokeEntity> pokes;
  final int index;

  DetailsPageParams({required this.pokes, required this.index});
}

class DetailsPage extends StatefulWidget {
  final DetailsPageParams params;

  const DetailsPage({Key? key, required this.params}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late PokeEntity pokeSelected;
  late PokedexTypesEnum type;

  int test = 1;

  late Color currentColor;

  @override
  void initState() {
    super.initState();
    _updatePokemon(widget.params.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      body: Stack(
        children: [
          CardBody(
            color: currentColor,
            pokemon: pokeSelected,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 9.0),
              child: PokedexIcon(
                color: currentColor.light(0.06),
                icon: PokedexIconsEnum.pokeball,
                size: 242,
              ),
            ),
          ),
          PokemonImages(
            pokemon: pokeSelected,
            next: () {},
            back: () {},
          ),
          HeaderTitle(
            name: pokeSelected.name,
          )
        ],
      ),
    );
  }

  void _updatePokemon([int index = 0]) {
    pokeSelected = widget.params.pokes[index];
    type = selectPokedexTypeByString(pokeSelected.types[0]);
    currentColor = AppColors.getColorForType(type);
  }
}
