import 'package:pokedex/core/domain/entities/poke_entity.dart';

import '../../../../utils/result_wrapper/result_wrapper.dart';

abstract class PokedexRepository{
  Future<Result<List<PokeEntity>>> getPoke();
}