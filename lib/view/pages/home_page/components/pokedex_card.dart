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
                    elevation: 3.0,
                  margin: const EdgeInsets.only(left: 0, top: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),

                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 44,
                  width: 150,
                  child: Card(elevation: 0.0,margin: const EdgeInsets.only(left: 0, top: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),color: AppColors.shadow,),
                ),
              ),
              Center(
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.network(
                      fit : BoxFit.cover,
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png'),
                  )),
             const  Align(alignment:Alignment.bottomCenter,child: Padding(
                padding:  EdgeInsets.only(bottom:4 ),
                child: Text("Bulbasaur"),
              )),

              Container(
                height: 150,
                  width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0x0f181818),  // Cor da borda
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),),
            ],
          ),
    );
  }
}
