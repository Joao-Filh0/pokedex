import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/commons/pokedex_ui/blocs/validator_bloc.dart';
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

  late Color currentColor;
  late ValidatorBloc<int> _jumpPokemonBloc;

  @override
  void initState() {
    super.initState();
    _updatePokemon(widget.params.index);
    _jumpPokemonBloc = ValidatorBloc<int>(widget.params.index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ValidatorBloc<int>, int>(
      bloc: _jumpPokemonBloc,
      builder: (context, indexPage) {
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
                  padding: EdgeInsets.only(right: size.height * 0.02),
                  child: PokedexIcon(
                    color: currentColor.light(0.06),
                    icon: PokedexIconsEnum.pokeball,
                    size: size.height * 0.25,
                  ),
                ),
              ),
              PokemonImages(
                pokemon: pokeSelected,
                next: indexPage + 1 >= widget.params.pokes.length
                    ? null
                    : () {
                        indexPage++;
                        _updatePokemon(indexPage);
                        _jumpPokemonBloc(indexPage);
                      },
                back: indexPage > 0
                    ? () {
                        indexPage--;
                        _updatePokemon(indexPage);
                        _jumpPokemonBloc(indexPage);
                      }
                    : null,
              ),
              HeaderTitle(
                name: pokeSelected.name,
              )
            ],
          ),
        );
      },
    );
  }

  void _updatePokemon([int index = 0]) {
    pokeSelected = widget.params.pokes[index];
    type = selectPokedexTypeByString(pokeSelected.types[0]);
    currentColor = AppColors.getColorForType(type);
  }
}
