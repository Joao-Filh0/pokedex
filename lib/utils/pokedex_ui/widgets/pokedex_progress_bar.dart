import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/utils/pokedex_ui/cubits/validator_bloc.dart';
import 'package:pokedex/utils/pokedex_ui/extensions/color_extension.dart';

class PokedexProgressBar extends StatefulWidget {
  final double value;
  final Color color;

  const PokedexProgressBar({Key? key, required this.value, required this.color})
      : super(key: key);

  @override
  State<PokedexProgressBar> createState() => _PokedexProgressBarState();
}

class _PokedexProgressBarState extends State<PokedexProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late ValidatorCubit<double> _validatorCubit;
  double countUpdate = 0;

  @override
  void initState() {
    super.initState();
    _validatorCubit = ValidatorCubit<double>(countUpdate);

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.value).animate(_controller)
      ..addListener(() {
        _validatorCubit(countUpdate);
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
    return BlocBuilder<ValidatorCubit<double>, double>(
      bloc: _validatorCubit,
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: SizedBox(
            height: 6.0,
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
