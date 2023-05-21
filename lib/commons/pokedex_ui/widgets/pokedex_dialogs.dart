import 'package:flutter/material.dart';
import 'package:pokedex/commons/config/strings.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';

class PokedexDialog {
  static void sortBy(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.height * 0.16,
                right: MediaQuery.of(context).size.width * 0.04,
                child: Container(
                  width: 113,
                  height: 132,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                              child: PokedexText(
                            text: AppString.sortBy,
                            size: 12,
                            color: AppColors.light,
                          )),
                        ),
                        Expanded(
                          child: Container(
                            width: 105,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.light,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Column(
                              children: [
                                // TODO (Joao) : Implementar os radios
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
}
