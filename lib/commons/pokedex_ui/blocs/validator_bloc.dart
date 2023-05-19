import 'package:flutter_bloc/flutter_bloc.dart';

class ValidatorBloc<T> extends Cubit<T> {
  ValidatorBloc(T value) : super(value);

  void call(T value) {
    emit(value);
  }
}
