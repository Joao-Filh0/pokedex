import 'package:flutter_bloc/flutter_bloc.dart';

class ValidatorCubit<T> extends Cubit<T> {
  ValidatorCubit(T value) : super(value);

  void call(T value) {
    emit(value);
  }
}
