import 'package:flutter/material.dart';
import 'package:pokedex/utils/pokedex_ui/palettes/colors.dart';
import '../../../utils/pokedex_ui/widgets/pokedex_input_field.dart';
import 'components/header_component.dart';
import 'components/pokedex_card.dart';
import 'components/pokedex_filter_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          const SizedBox(
            height: 180.0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 16.0),
                  child: HeaderComponent(),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(child: PokedexInputField()),
                      SizedBox(
                        width: 16,
                      ),
                      PokedexFilterButton()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 3,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return const PokedexCard();
                      }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
