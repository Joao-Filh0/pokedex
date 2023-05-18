class BaseError<T> extends Error {
  final String message;

  BaseError(this.message);

  @override
  String toString() {
    return message;
  }
}
