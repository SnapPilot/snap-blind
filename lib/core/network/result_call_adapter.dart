import 'package:dio/dio.dart';
import 'package:snap_blind/core/error/result.dart';

abstract interface class CallAdapter<R, T> {
  T adapt(R Function() call);
}

class ResultCallAdapter<T> extends CallAdapter<Future<T>, Future<Result<T>>> {
  @override
  Future<Result<T>> adapt(Future<T> Function() call) async {
    try {
      final T response = await call();
      return Result.ok(response);
    } on DioException catch (e, stack) {
      return Result.error(Exception('DioException error: $e\nstack:$stack'));
    } on Exception catch (e, stack) {
      return Result.error(Exception('Unknown error: $e\nstack:$stack'));
    }
  }
}
