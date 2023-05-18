import 'package:flutter/material.dart';
import 'package:pokedex/utils/pokedex_ui/palettes/colors.dart';

class PokedexCard extends StatelessWidget {
  const PokedexCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
        height: 150,
        width: 150,
        child: Stack(
            children: [

              SizedBox(
                height: 150,
                width: 150,
                child: Card(
                    elevation: 2.0,
                  margin: const EdgeInsets.only(left: 0, top: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 60,
                  width: 150,
                  child: Card(elevation: 0.0,margin: EdgeInsets.only(left: 0, top: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),color: AppColors.shadow,),
                ),
              ),
              Center(
                  child: Image.network(
                    fit : BoxFit.cover,
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/3.png')),
              Align(alignment:Alignment.bottomCenter,child: Padding(
                padding: const EdgeInsets.only(bottom:4 ),
                child: Text("venusaur"),
              ))
            ],
          ),
    );
  }
}
