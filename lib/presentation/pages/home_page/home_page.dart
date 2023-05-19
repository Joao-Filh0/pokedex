import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/commons/config/routes.dart';
import 'package:pokedex/commons/config/strings.dart';
import 'package:pokedex/commons/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_filter_button.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_input_field.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_text.dart';
import 'package:pokedex/commons/states/bloc_states.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/presentation/pages/details_page/details_page.dart';
import 'package:pokedex/presentation/pages/home_page/blocs/get_pokemon_bloc.dart';
import 'components/header_component.dart';
import 'components/pokedex_card_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  final FocusNode searchFocusNode = FocusNode();
  late GetPokemonBloc _bloc;

  static const _gridPadding = 8.0;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _bloc = Modular.get<GetPokemonBloc>();
    _bloc();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(
            height: 150.0,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 16.0),
                  child: HeaderComponent(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: PokedexInputField(
                        controller: searchController,
                        focusNode: searchFocusNode,
                        hintText: AppString.search,
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      PokedexFilterButton(onTap: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: _gridPadding,
                  right: _gridPadding,
                  bottom: _gridPadding),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.light,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(_gridPadding),
                  child: BlocBuilder<GetPokemonBloc, BaseState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is SuccessState<List<PokeEntity>>) {
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 3,
                            ),
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              return PokedexCardComponent(
                                tag: state.data[index].name,
                                onTap: () {
                                  searchFocusNode.unfocus();
                                  final params = DetailsPageParams(
                                      pokes: state.data, index: index);
                                  Modular.to.pushNamed(AppRoutes.details,
                                      arguments: params);
                                },
                                id: "#00${state.data[index].id}",
                                imageUrl: state.data[index].image,
                                name: state.data[index].name,
                              );
                            });
                      }
                      if (state is ErrorState) {
                        return Center(
                          child: PokedexText(text: state.message),
                        );
                      }
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ));
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
