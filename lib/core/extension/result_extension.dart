import 'package:snap_blind/core/error/result.dart';

extension ResultExtension<T> on Result<T> {
  R when<R>({
    required R Function(T value) ok,
    required R Function(Exception e) exception,
  }) {
    return switch (this) {
      Ok(:final value) => ok(value),
      Error(:final error) => exception(error),
    };
  }
}
