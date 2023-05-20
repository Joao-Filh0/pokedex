import 'package:equatable/equatable.dart';

class PokeEntity extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final List<String> abilities;
  final String image;
  final double weight;
  final double height;
  final double hp;
  final double atk;
  final double def;
  final double satk;
  final double sdef;
  final double spd;

  const PokeEntity({
    required this.id,
    required this.name,
    required this.types,
    required this.abilities,
    required this.image,
    required this.weight,
    required this.height,
    required this.hp,
    required this.atk,
    required this.def,
    required this.satk,
    required this.sdef,
    required this.spd,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        types,
        abilities,
        image,
        weight,
        height,
        hp,
        atk,
        def,
        satk,
        sdef,
        spd,
      ];
}
