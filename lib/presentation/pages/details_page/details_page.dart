import 'package:flutter/material.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/utils/pokedex_ui/enums/pokedex_types_enum.dart';
import 'package:pokedex/utils/pokedex_ui/helpers/select_pokedex_type_by_string.dart';
import 'package:pokedex/utils/pokedex_ui/palettes/colors.dart';

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
  late PokedexTypesEnum type ;

  @override
  void initState() {
    super.initState();
    pokeSelected = widget.params.pokes[widget.params.index];
    type = selectPokedexTypeByString(pokeSelected.types[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColorForType(type),
      body: Column(
        children: [
          Spacer(),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.light,
            ),
            child: Column(
              children: [
                Text("dsfeffesssdfdsfds")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
