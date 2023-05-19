import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/presentation/pages/details_page/details_page.dart';
import 'package:pokedex/presentation/pages/home_page/blocs/get_pokemon_bloc.dart';
import 'package:pokedex/utils/config/routes.dart';
import 'package:pokedex/utils/pokedex_ui/palettes/colors.dart';
import 'package:pokedex/utils/states/bloc_states.dart';
import '../../../utils/pokedex_ui/widgets/pokedex_input_field.dart';
import 'components/header_component.dart';
import 'components/pokedex_card_component.dart';
import '../../../utils/pokedex_ui/widgets/pokedex_filter_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          SizedBox(
            height: 180.0,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60, left: 16.0),
                  child: HeaderComponent(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: PokedexInputField(
                        controller: searchController,
                        hintText: "Search",
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
                  padding: const EdgeInsets.only(
                      left: _gridPadding,
                      right: _gridPadding,
                      bottom: _gridPadding),
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
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              return PokedexCardComponent(
                                onTap: () {
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
                          child: Text(state.message),
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
