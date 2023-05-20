import 'package:flutter/material.dart';
import 'package:pokedex/commons/config/strings.dart';
import 'package:pokedex/commons/pokedex_ui/extensions/color_extensions.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_progress_bar.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';

class PokemonStatisticsComponent extends StatefulWidget {
  final Color color;
  final double hp;
  final double atk;
  final double def;
  final double satk;
  final double sdef;
  final double spd;

  const PokemonStatisticsComponent(
      {Key? key,
      required this.color,
      required this.hp,
      required this.atk,
      required this.def,
      required this.satk,
      required this.sdef,
      required this.spd})
      : super(key: key);

  @override
  State<PokemonStatisticsComponent> createState() => _PokemonStatisticsComponentState();
}

class _PokemonStatisticsComponentState extends State<PokemonStatisticsComponent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            PokedexText(
                text: AppString.hp, isFontFamily: true, color: widget.color),
            PokedexText(
                text: AppString.atk, isFontFamily: true, color: widget.color),
            PokedexText(
                text: AppString.def, isFontFamily: true, color: widget.color),
            PokedexText(
                text: AppString.satk, isFontFamily: true, color: widget.color),
            PokedexText(
                text: AppString.sdef, isFontFamily: true, color: widget.color),
            PokedexText(
                text: AppString.spd, isFontFamily: true, color: widget.color),
          ],
        ),
        SizedBox(
            height: size.height * 0.15,
            child: VerticalDivider(
              color: AppColors.neutral.light(0.4),
              thickness: 2,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              _ProgressWithLabel(value: widget.hp, color: widget.color),
              _ProgressWithLabel(value: widget.atk, color: widget.color),
              _ProgressWithLabel(value: widget.def, color: widget.color),
              _ProgressWithLabel(value: widget.satk, color: widget.color),
              _ProgressWithLabel(value: widget.sdef, color: widget.color),
              _ProgressWithLabel(value: widget.spd, color: widget.color),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProgressWithLabel extends StatelessWidget {
  final Color color;
  final double value;


  const _ProgressWithLabel({Key? key, required this.color, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.006),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.02),
            child: PokedexText(text: '$value'.replaceAll(".", "")),
          ),
          SizedBox(
            width: size.width * 0.6,
            child: PokedexProgressBar(
              color: color,
              value: value,
              size: size.height * 0.007,
            ),
          ),
        ],
      ),
    );
  }
}
