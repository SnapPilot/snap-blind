import 'package:snap_blind/core/error/result.dart';

abstract class CallAdapter<R, T> {
  T adapt(R Function() call);
}

class ResultCallAdapter<T> extends CallAdapter<Future<T>, Future<Result<T>>> {
  @override
  Future<Result<T>> adapt(Future<T> Function() call) async {
    try {
      final T response = await call();
      return Result.ok(response);
    } catch (e, stack) {
      return Result.error(
        e is Exception ? e : Exception('Unknown error: $e\nstack:$stack'),
      );
    }
  }
}
