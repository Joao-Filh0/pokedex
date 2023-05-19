import 'package:flutter/material.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_icon.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';

class PokemonImages extends StatelessWidget {
  final VoidCallback next;
  final VoidCallback back;
  final PokeEntity pokemon;

  const PokemonImages(
      {Key? key, required this.next, required this.back, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: back,
                child: PokedexIcon(
                  icon: PokedexIconsEnum.left,
                  size: 11.43,
                  color: AppColors.light,
                ),
              ),
              const Spacer(),
              Hero(
                  tag: pokemon.name,
                  child: Image.network(
                      width: 220,
                      height: 220,
                      fit: BoxFit.cover,
                      pokemon.image)),
              const Spacer(),
              GestureDetector(
                onTap: next,
                child: SizedBox(
                  child: PokedexIcon(
                    icon: PokedexIconsEnum.right,
                    size: 11.43,
                    color: AppColors.light,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
