import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/commons/result_wrapper/result_wrapper.dart';
import 'package:pokedex/core/data/datasources/pokedex_datasource/pokedex_datasource.dart';
import 'package:pokedex/core/data/models/poke_model/poke_model.dart';
import 'package:pokedex/core/data/models/poke_urls_model/poke_urls_model.dart';
import 'package:pokedex/core/data/repositories/pokedex_repository/pokedex_repository_impl.dart';
import 'package:pokedex/core/domain/entities/poke_entity.dart';
import 'package:pokedex/core/domain/entities/poke_urls_entity.dart';
import 'package:pokedex/core/domain/repositories/pokedex_repository/pokedex_repository.dart';

import '../../data_mock.dart';

class PokedexDataSourceMock extends Mock implements PokedexDataSource {}

void main() {
  late PokedexDataSource datasource;
  late PokedexRepository repository;
  late PokeEntity models;
  late PokeUrlsEntity urlsModel;

  setUpAll(() {
    datasource = PokedexDataSourceMock();
    repository = PokedexRepositoryImpl(datasource);
    models = PokeModel.fromMap(pokeDataMock);
    urlsModel = PokeUrlsModel.fromMap(pokeUrlsDataMock);
  });
  group('[DATA] - PokedexRepository', () {
    test('When DataSource Success', () async {
      // when
      when(() => datasource.getPokeUrl()).thenAnswer((_) async => urlsModel);

      when(() => datasource.getPokeInfo(any())).thenAnswer((_) async => models);
      // give
      var result = await repository.getPoke();
      // expect
      expect(result.isSuccess, true);
      expect(result, isA<ResultSuccess<List<PokeEntity>>>());
    });
    test('When DataSource Error ', () async {
      // when
      when(() => datasource.getPokeUrl()).thenThrow(Exception('error'));
      // give
      var result = await repository.getPoke();
      // expect
      expect(result.isError, true);
      expect(result.errorData.message, 'Exception: error');
    });
  });
}
