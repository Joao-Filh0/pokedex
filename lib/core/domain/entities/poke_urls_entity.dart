import 'package:equatable/equatable.dart';

class PokeUrlsEntity extends Equatable {
  final List<String> urls;

  const PokeUrlsEntity(this.urls);

  @override
  List<Object?> get props => [urls];
}
