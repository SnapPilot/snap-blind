import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/data/auth/repository/supabase_auth_repository.dart';
import 'package:snap_blind/domain/auth/entity/auth_token_entity.dart';
import 'package:snap_blind/data/auth/response/oauth_api_response.dart';
import 'package:snap_blind/domain/auth/entity/user_entity.dart';
import 'package:snap_blind/domain/auth/repository/auth_repository.dart';
import 'package:snap_blind/presenter/base/base_bloc.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/bloc/auth/auth_event.dart';
import 'package:snap_blind/presenter/bloc/auth/auth_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

@injectable
final class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(this._oAuthRepository, this._supabaseAuthRepository)
    : super(const AuthState()) {
    on<KaKaoLoginRequestEvent>(_onKaKaoLogin);
    on<LoginRequestEvent>(_onLogin);
  }

  final AuthRepository _oAuthRepository;
  final SupabaseAuthRepository _supabaseAuthRepository;

  /// app TODO: 이벤트 버스 패턴 적용
  void _onKaKaoLogin(
    KaKaoLoginRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(stateType: BaseStateType.inProgress));

    final Result<OAuthApiResponse> authApiResponse =
        await _oAuthRepository.login();

    authApiResponse.when(
      ok: (authApiResponse) {
        final UserEntity userEntity = authApiResponse.userEntity;
        final AuthTokenEntity authTokenEntity = authApiResponse.authTokenEntity;

        emit(KaKaoLoginSuccessState(userEntity, authTokenEntity));
      },
      exception: (error) {
        emit(KaKaoLoginFailureState(message: error.toString()));
      },
    );
  }

  void _onLogin(LoginRequestEvent event, Emitter<AuthState> emit) async {
    final Result<supabase.AuthResponse> supabaseAuthResponse =
        await _supabaseAuthRepository.login(
          idToken: event.authTokenEntity.idToken ?? '',
          accessToken: event.authTokenEntity.accessToken,
        );

    supabaseAuthResponse.when(
      ok: (supabaseResponse) {
        emit(
          LoginSuccessState(
            event.userEntity.copyWith(email: supabaseResponse.user?.email),
          ),
        );
      },
      exception: (error) {
        emit(SupabaseLoginFailureState(message: error.toString()));
      },
    );
  }
}
