import 'package:flutter/material.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_icon_button.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';

class PokemonImages extends StatelessWidget {
  final VoidCallback? next;
  final VoidCallback? back;
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
              PokedexIconButton(
                icon: PokedexIconsEnum.left,
                visible: back != null,
                onTap: back,
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
              PokedexIconButton(
                icon: PokedexIconsEnum.right,
                visible: next != null,
                onTap: next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
