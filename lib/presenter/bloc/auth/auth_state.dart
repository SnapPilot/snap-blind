import 'package:flutter/foundation.dart';
import 'package:snap_blind/domain/auth/entity/auth_token_entity.dart';
import 'package:snap_blind/domain/auth/entity/user_entity.dart';
import 'package:snap_blind/presenter/base/base_state.dart';

@immutable
base class AuthState extends BaseState {
  const AuthState({
    super.stateType,
    super.errorMessage,
    this.userEntity,
    this.authTokenEntity,
  });

  final UserEntity? userEntity;
  final AuthTokenEntity? authTokenEntity;

  @override
  List<Object?> get props => [...super.props, userEntity, authTokenEntity];

  AuthState copyWith({
    UserEntity? userEntity,
    AuthTokenEntity? authTokenEntity,
    BaseStateType? stateType,
    String? errorMessage,
  }) {
    return AuthState(
      stateType: stateType ?? this.stateType,
      errorMessage: errorMessage ?? this.errorMessage,
      userEntity: userEntity ?? this.userEntity,
      authTokenEntity: authTokenEntity ?? this.authTokenEntity,
    );
  }
}

@immutable
final class KaKaoLoginSuccessState extends AuthState {
  const KaKaoLoginSuccessState(
    UserEntity userEntity,
    AuthTokenEntity authTokenEntity,
  ) : super(
        stateType: BaseStateType.success,
        userEntity: userEntity,
        authTokenEntity: authTokenEntity,
      );
}

@immutable
final class LoginSuccessState extends AuthState {
  const LoginSuccessState(UserEntity userEntity)
    : super(stateType: BaseStateType.success, userEntity: userEntity);
}

@immutable
final class KaKaoLoginFailureState extends AuthState {
  const KaKaoLoginFailureState({this.message = ""});

  final String message;
}

@immutable
final class SupabaseLoginFailureState extends AuthState {
  const SupabaseLoginFailureState({this.message = ""});

  final String message;
}
