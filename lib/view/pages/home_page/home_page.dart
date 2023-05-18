import 'package:flutter/material.dart';
import 'package:pokedex/utils/pokedex_ui/palettes/colors.dart';
import 'components/pokedex_card.dart';

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
          Expanded(
            child: SizedBox(
              child: TextFormField(),
             ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height*0.75,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing : 10,
                   crossAxisSpacing: 10,
                    crossAxisCount: 3,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return const PokedexCard();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Scaffold(
  backgroundColor: AppColors.primary,
  body: SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          child: TextFormField(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.75, //ajuste a altura para adequar à sua necessidade
            child: Scrollbar( //Adicione Scrollbar para visualizar a rolagem
              isAlwaysShown: true,
              controller: _scrollController, //defina o mesmo controlador para Scrollbar e GridView
              child: GridView.builder(
                controller: _scrollController, //defina o mesmo controlador para Scrollbar e GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                ),
                itemCount: 26,
                itemBuilder: (context, index) {
                  return const PokedexCard();
                },
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);
ScrollController _scrollController = ScrollController();

 */