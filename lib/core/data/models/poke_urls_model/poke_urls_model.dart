import 'package:pokedex/core/domain/entities/poke_urls_entity.dart';

class PokeUrlsModel extends PokeUrlsEntity {
  const PokeUrlsModel(super.urls);

  factory PokeUrlsModel.fromMap(Map<String, dynamic> map) {
    final urls = map["results"]
        .map<String>((element) => (element["url"] as String))
        .toList();

    return PokeUrlsModel(urls);
  }
}
