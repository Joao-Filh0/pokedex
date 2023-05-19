import 'package:equatable/equatable.dart';

class PokeEntity extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final List<String> abilities;
  final String image;
  final double weight;
  final double height;

  const PokeEntity(
      {required this.id,
      required this.name,
      required this.types,
      required this.abilities,
      required this.image,
      required this.weight,
      required this.height});

  @override
  List<Object?> get props => [
        name,
        types,
        abilities,
        image,
        weight,
        height,
      ];
}
