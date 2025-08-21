import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/data/auth/exception/kakao_exception.dart';

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

class KakaoCallAdapter<T> extends CallAdapter<Future<T>, Future<Result<T>>> {
  @override
  Future<Result<T>> adapt(Future<T> Function() call) async {
    try {
      final T response = await call();
      return Result.ok(response);
    } on PlatformException catch (e) {
      /// * 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      /// * 의도적인 로그인 취소로 보고 카카오 계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (e.code == 'CANCELED') {
        return Result.error(KaKaoUserCanceledException());
      }

      return Result.error(e);
    } on Exception catch (e, stack) {
      return Result.error(Exception('Unknown error: $e\nstack:$stack'));
    }
  }
}
