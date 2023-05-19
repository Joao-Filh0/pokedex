import 'package:flutter/material.dart';
import 'package:pokedex/commons/pokedex_ui/extensions/color_extension.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_progress_bar.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';

class PokemonStatistics extends StatefulWidget {
  final Color color;
  final double hp;
  final double atk;
  final double def;
  final double satk;
  final double sdef;
  final double spd;

  const PokemonStatistics(
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
  State<PokemonStatistics> createState() => _PokemonStatisticsState();
}

class _PokemonStatisticsState extends State<PokemonStatistics> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            PokedexText(text: "HP", isFontFamily: true, color: widget.color),
            PokedexText(text: "ATK", isFontFamily: true, color: widget.color),
            PokedexText(text: "DEF", isFontFamily: true, color: widget.color),
            PokedexText(text: "SATK", isFontFamily: true, color: widget.color),
            PokedexText(text: "SDEF", isFontFamily: true, color: widget.color),
            PokedexText(text: "SPD", isFontFamily: true, color: widget.color),
          ],
        ),
        SizedBox(
            height: 115,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Text('$value'.replaceAll(".", "")),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: PokedexProgressBar(
                color: color,
                value: value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
