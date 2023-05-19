import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/commons/config/routes.dart';
import 'package:pokedex/commons/http_client/dio_http_client_impl.dart';
import 'package:pokedex/commons/http_client/http_client.dart';
import 'package:pokedex/commons/pokedex_ui/widgets/pokedex_scroll_configuration.dart';
import 'package:pokedex/core/data/datasources/pokedex_datasource/pokedex_datasource.dart';
import 'package:pokedex/core/data/repositories/pokedex_repository/pokedex_repository_impl.dart';
import 'package:pokedex/core/domain/repositories/pokedex_repository/pokedex_repository.dart';
import 'package:pokedex/core/domain/use_cases/get_pokemon_use_case/get_pokemon_use_case.dart';
import 'package:pokedex/core/domain/use_cases/get_pokemon_use_case/get_pokemon_use_case_impl.dart';
import 'package:pokedex/presentation/pages/details_page/details_page.dart';
import 'package:pokedex/presentation/pages/home_page/blocs/get_pokemon_bloc.dart';
import 'package:pokedex/presentation/pages/home_page/home_page.dart';

import 'core/data/datasources/pokedex_datasource/pokedex_datasource_impl.dart';

class AppStart extends StatelessWidget {
  const AppStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Pokédex',
      theme: ThemeData(
          //fontFamily: 'Poppins',
          ),
      builder: (context, child) => SafeArea(
        child: PokedexScrollConfiguration(
          child: child,
        ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //Dependencies
        Bind.instance<Dio>(Dio()),
        Bind.factory<HttpAppClient>((i) => DioHttpClient(i())),
        //DataSources
        Bind.factory<PokedexDataSource>((i) => PokedexDataSourceImpl(i())),
        //Repositories
        Bind.factory<PokedexRepository>((i) => PokedexRepositoryImpl(i())),

        //UseCases
        Bind.factory<GetPokemonUseCase>((i) => GetPokemonUseCaseImpl(i())),
        //Blocs and Cubits
        Bind.factory<GetPokemonBloc>((i) => GetPokemonBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.root, child: (context, args) => const HomePage()),
        ChildRoute(AppRoutes.details,
            child: (context, args) => DetailsPage(params: args.data),
            transition: TransitionType.fadeIn),
      ];
}
