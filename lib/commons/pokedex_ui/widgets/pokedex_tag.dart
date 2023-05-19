import 'package:flutter/material.dart';
import 'package:pokedex/commons/pokedex_ui/enums/pokedex_types_enum.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';

class PokedexTag extends StatelessWidget {
  final PokedexTypesEnum type;
  const PokedexTag({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.getColorForType(type),
      ),
      padding: const EdgeInsets.all(6),
      child: FittedBox(
        child: Text(
          type.name,
          style: TextStyle(
            color: AppColors.light, // Cor do texto
          ),
        ),
      ),
    );
  }
}
