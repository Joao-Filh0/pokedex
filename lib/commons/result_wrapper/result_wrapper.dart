import '../errors/base_error.dart';

abstract class Result<T> {
  T? _success;
  BaseError? _error;

  Result();

  void setSuccess(T success) {
    _success = success;
  }

  void setError(BaseError error) {
    _error = error;
  }

  bool get isSuccess => _success != null;

  bool get isError => _error != null;

  T get successData => _success!;

  BaseError get errorData => _error!;
}

class ResultSuccess<S> extends Result<S> {
  ResultSuccess(S success) {
    super.setSuccess(success);
  }
}

class ResultError<E> extends Result<E> {
  ResultError(BaseError error) {
    super.setError(error);
  }
}
