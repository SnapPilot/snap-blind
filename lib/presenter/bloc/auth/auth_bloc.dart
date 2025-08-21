import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/domain/auth/entity/auth_token_entity.dart';
import 'package:snap_blind/domain/auth/repository/auth_repository.dart';
import 'package:snap_blind/presenter/base/base_bloc.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/bloc/auth/auth_event.dart';
import 'package:snap_blind/presenter/bloc/auth/auth_state.dart';

@injectable
final class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(const AuthState()) {
    on<LoginRequestEvent>(_onLogin);
  }

  final AuthRepository _authRepository;

  /// app TODO: 이벤트 버스 패턴 적용
  Future<void> _onLogin(
    LoginRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(stateType: BaseStateType.inProgress));

    final Result<AuthTokenEntity> authToken = await _authRepository.login();

    authToken.when(
      ok: (token) {
        emit(LoginSuccessState(token));
      },
      exception: (error) {
        emit(LoginFailureState(message: error.toString()));
      },
    );
  }
}
