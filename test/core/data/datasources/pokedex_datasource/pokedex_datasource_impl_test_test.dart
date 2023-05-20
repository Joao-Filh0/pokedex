import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/commons/http_client/http_client.dart';
import 'package:pokedex/core/data/datasources/pokedex_datasource/pokedex_datasource.dart';
import 'package:pokedex/core/data/datasources/pokedex_datasource/pokedex_datasource_impl.dart';
import 'package:pokedex/core/data/models/poke_model/poke_model.dart';
import 'package:pokedex/core/data/models/poke_urls_model/poke_urls_model.dart';

import '../../data_mock.dart';

class HttpAppClientMock extends Mock implements HttpAppClient {}

void main() {
  late HttpAppClient httpClient;
  late PokedexDataSource datasource;
  const urlMock = 'https://urls-mock.com';

  setUp(() async {
    httpClient = HttpAppClientMock();
    datasource = PokedexDataSourceImpl(httpClient);
  });

  group(
    '[DATA] - PokedexDataSource',
    () {
      test('getPokeUrl - SUCCESS', () async {
        when(() => httpClient.get(any(),
            queryParameters: {"limit": "18", "offset": "7"})).thenAnswer(
          (_) async => Response(
            data: pokeUrlsDataMock,
            requestOptions: RequestOptions(
              path: "",
            ),
          ),
        );

        final result = await datasource.getPokeUrl();

        expect(result, isA<PokeUrlsModel>());
      });

      test('getPokeUrl - ERROR', () async {
        when(
          () => httpClient
              .get(any(), queryParameters: {"limit": "18", "offset": "7"}),
        ).thenThrow(Exception());
        try {
          await datasource.getPokeUrl();
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('getPokeInfo - SUCCESS', () async {
        when(() => httpClient.get(
              urlMock,
            )).thenAnswer(
          (_) async => Response(
            data: pokeDataMock,
            requestOptions: RequestOptions(
              path: "",
            ),
          ),
        );

        final result = await datasource.getPokeInfo(urlMock);

        expect(result, isA<PokeModel>());
      });

      test('getPokeInfo - ERROR', () async {
        when(
          () => httpClient.get(urlMock),
        ).thenThrow(Exception());
        try {
          await datasource.getPokeInfo(urlMock);
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });
    },
  );
}
