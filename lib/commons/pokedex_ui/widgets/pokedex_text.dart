import 'package:flutter/material.dart';

class PokedexText extends StatelessWidget {
  final String text;
  final bool isFontFamily;
  final Color? color;
  final double? size;

  const PokedexText({
    Key? key,
    required this.text,
    this.color,
    this.isFontFamily = false,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: isFontFamily ? "Poppins" : null,
            color: color,
            fontSize: size));
  }
}
