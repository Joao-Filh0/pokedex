import '../errors/base_error.dart';

abstract class Result<T> {
  T? _success;
  BaseError? _error;

  Result(Object object) {
    if (object is ResultSuccess) {
      _success = object as T;
    }

    if (object is ResultError) {
      _error = object as BaseError;
    }
  }

  bool get isSuccess => _success != null;

  bool get isError => _error != null;

  T get successData => _success!;

  BaseError get errorData => _error!;
}

class ResultSuccess<S> extends Result<S> {
  @override
  final S _success;

  ResultSuccess(this._success) : super(_success!);
}

class ResultError<E> extends Result<E> {
  @override
  final BaseError _error;

  ResultError(this._error) : super(_error);
}
