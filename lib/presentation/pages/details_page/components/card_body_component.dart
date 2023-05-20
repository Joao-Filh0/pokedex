import 'package:flutter/material.dart';
import 'package:pokedex/commons/config/strings.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_animation_types.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/presentation/pages/details_page/components/pokemon_info_component.dart';
import 'package:pokedex/presentation/pages/details_page/components/pokemon_statistics_component.dart';

class CardBodyComponent extends StatelessWidget {
  final Color color;
  final PokeEntity pokemon;

  const CardBodyComponent({Key? key, required this.color, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingSize = size.height * 0.01;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox.shrink()),
        Padding(
          padding: EdgeInsets.only(left: paddingSize, right: paddingSize, bottom: paddingSize),
          child: Container(
            height: size.height * 0.69,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.light,
            ),
            child: Padding(
              padding:  EdgeInsets.only(top: size.height * 0.06),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PokedexAnimationTypes(
                      types: pokemon.types,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: PokedexText(
                        text: AppString.about,
                        color: color,
                        isFontFamily: true,
                        size: size.height * 0.027,
                      ),
                    ),
                    PokemonInfoComponent(
                      abilities: pokemon.abilities,
                      weight: pokemon.weight,
                      height: pokemon.height,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02, horizontal: size.height * 0.03),
                      child: PokedexText(
                        text: AppString.pokemonDescriptionMock,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.01),
                      child: PokedexText(
                        text: AppString.baseStats,
                        color: color,
                        isFontFamily: true,
                        size: size.height * 0.027,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.01),
                      child: PokemonStatisticsComponent(
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
        ),
      ],
    );
  }
}
