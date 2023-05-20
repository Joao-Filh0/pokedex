import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/commons/errors/base_error.dart';
import 'package:pokedex/commons/result_wrapper/result_wrapper.dart';

void main() {
  group('[COMMONS] - ResultSuccess', () {
    test('should set the success', () {
      final result = ResultSuccess<int>(42);
      expect(result.successData, 42);
    });
  });

  group('ResultError', () {
    test('should set the error', () {
      const String message = "message error";
      final error = BaseError(message);
      final result = ResultError<int>(error);
      expect(result.errorData, error);
      expect(result.errorData.message, message);
    });
  });
}
