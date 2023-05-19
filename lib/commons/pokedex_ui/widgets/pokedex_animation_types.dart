import 'package:flutter/material.dart';
import 'package:pokedex/commons/pokedex_ui/helpers/select_pokedex_type_by_string.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_tag.dart';

class PokedexAnimationTypes extends StatefulWidget {
  final List<String> types;

  const PokedexAnimationTypes({Key? key, required this.types})
      : super(key: key);

  @override
  State<PokedexAnimationTypes> createState() => _PokedexAnimationTypesState();
}

class _PokedexAnimationTypesState extends State<PokedexAnimationTypes> {
  bool divided = false;

  @override
  Widget build(BuildContext context) {
    // TODO (Joao) fazer animações quando troca os tipos
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.types
            .map((type) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: PokedexTag(type: selectPokedexTypeByString(type)),
                ))
            .toList());
  }
}
