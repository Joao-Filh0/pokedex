import 'package:flutter/material.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/utils/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/utils/pokedex_ui/enums/pokedex_types_enum.dart';
import 'package:pokedex/utils/pokedex_ui/extensions/color_extension.dart';
import 'package:pokedex/utils/pokedex_ui/helpers/select_pokedex_type_by_string.dart';
import 'package:pokedex/utils/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/utils/pokedex_ui/widgets/pokedex_icon.dart';
import 'package:pokedex/utils/pokedex_ui/widgets/pokedex_progress_bar.dart';

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

  @override
  void initState() {
    super.initState();
    pokeSelected = widget.params.pokes[widget.params.index];
    type = selectPokedexTypeByString(pokeSelected.types[0]);
    currentColor = AppColors.getColorForType(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      body: Stack(
        children: [
          Column(
            children: [
              const Expanded(child: SizedBox.shrink()),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.light,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PokedexProgressBar(
                          color: currentColor,
                          value: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: PokedexIcon(
              color: currentColor.light(0.06),
              icon: PokedexIconsEnum.pokeball,
              size: 242,
            ),
          ),
          Positioned(
            top: 110,
            left: 80,
            child: Hero(
                tag: pokeSelected.name,
                child: Image.network(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    pokeSelected.image)),
          )
        ],
      ),
    );
  }
}
