import 'package:flutter/material.dart';
import 'package:pokedex/commons/config/strings.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_animation_types.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/presentation/pages/details_page/components/pokemon_info.dart';
import 'package:pokedex/presentation/pages/details_page/components/pokemon_statistics.dart';

class CardBody extends StatelessWidget {
  final Color color;
  final PokeEntity pokemon;

  const CardBody({Key? key, required this.color, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox.shrink()),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.light,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PokedexAnimationTypes(
                    types: pokemon.types,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: PokedexText(
                      text: AppString.about,
                      color: color,
                      isFontFamily: true,
                      size: 20.0,
                    ),
                  ),
                  const PokemonInfo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 15.0),
                    child: PokedexText(
                      text: AppString.pokemonDescriptionMock,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PokedexText(
                      text: AppString.baseStats,
                      color: color,
                      isFontFamily: true,
                      size: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PokemonStatistics(
                      color: color,
                      hp: pokemon.hp,
                      atk: pokemon.atk,
                      def: pokemon.def,
                      satk: pokemon.satk,
                      sdef: pokemon.sdef,
                      spd: pokemon.spd,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
