import 'package:flutter/foundation.dart';
import 'package:snap_blind/domain/auth/entity/auth_token_entity.dart';
import 'package:snap_blind/presenter/base/base_state.dart';

@immutable
base class AuthState extends BaseState {
  const AuthState({super.stateType, super.errorMessage, this.tokenEntity});

  final AuthTokenEntity? tokenEntity;

  @override
  List<Object?> get props => [...super.props, tokenEntity];

  AuthState copyWith({
    AuthTokenEntity? tokenEntity,
    BaseStateType? stateType,
    String? errorMessage,
  }) {
    return AuthState(
      stateType: stateType ?? this.stateType,
      errorMessage: errorMessage ?? this.errorMessage,
      tokenEntity: tokenEntity ?? this.tokenEntity,
    );
  }
}

@immutable
final class LoginSuccessState extends AuthState {
  const LoginSuccessState(AuthTokenEntity token)
    : super(stateType: BaseStateType.success, tokenEntity: token);
}

@immutable
final class LoginFailureState extends AuthState {
  const LoginFailureState({this.message = ""});

  final String message;
}
