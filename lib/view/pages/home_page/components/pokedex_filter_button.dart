import 'package:flutter/material.dart';
import 'package:pokedex/utils/pokedex_ui/enums/pokedex_icons_enum.dart';
import 'package:pokedex/utils/pokedex_ui/widgets/pokedex_icon.dart';

class PokedexFilterButton extends StatelessWidget {
  const PokedexFilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  side: const BorderSide(color: Colors.white, width: 2))),
        ),
        onPressed: () {
          print('Botão pressionado');
        },
        child: const PokedexIcon(icon: PokedexIconsEnum.filter),
      ),
    );
  }
}
