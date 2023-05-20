import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/commons/pokedex_ui/blocs/validator_bloc.dart';
import 'package:pokedex/commons/pokedex_ui/extensions/color_extensions.dart';

class PokedexProgressBar extends StatefulWidget {
  final double value;
  final Color color;
  final double size;

  const PokedexProgressBar(
      {Key? key, required this.value, required this.color, required this.size})
      : super(key: key);

  @override
  State<PokedexProgressBar> createState() => _PokedexProgressBarState();
}

class _PokedexProgressBarState extends State<PokedexProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late ValidatorBloc<double> _validatorBloc;
  double countUpdate = 0;

  @override
  void initState() {
    super.initState();
    _validatorBloc = ValidatorBloc<double>(countUpdate);

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.value).animate(_controller)
      ..addListener(() {
        _validatorBloc(countUpdate);
        countUpdate++;
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidatorBloc<double>, double>(
      bloc: _validatorBloc,
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: SizedBox(
            height: widget.size,
            child: LinearProgressIndicator(
              color: widget.color,
              backgroundColor: widget.color.light(),
              value: _animation.value,
            ),
          ),
        );
      },
    );
  }
}
