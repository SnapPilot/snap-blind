import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/di/di.dart';
import 'package:snap_blind/core/enum/login_type.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/core/logger/app_logger.dart';
import 'package:snap_blind/data/auth/dto/oauth_api_dto.dart';
import 'package:snap_blind/data/auth/repository/supabase_auth_repository.dart';
import 'package:snap_blind/domain/auth/entity/auth_token_entity.dart';
import 'package:snap_blind/domain/auth/entity/user_entity.dart';
import 'package:snap_blind/domain/auth/repository/auth_repository.dart';
import 'package:snap_blind/domain/user/entity/user_profile_entity.dart';
import 'package:snap_blind/domain/user/repository/user_repository.dart';
import 'package:snap_blind/presenter/auth/auth_event.dart';
import 'package:snap_blind/presenter/auth/auth_state.dart';
import 'package:snap_blind/presenter/base/base_bloc.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/user/user_edit_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

@injectable
final class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(
    this._oAuthRepository,
    this._supabaseAuthRepository,
    this._userRepository,
  ) : super(const AuthState()) {
    on<KaKaoLoginRequestEvent>(_onKaKaoLogin);
    on<LoginRequestEvent>(_onLogin);
    on<AdminLoginRequestEvent>(_onAdminLogin);
    on<UserUpdateRequestEvent>(_onUserProfileUpdate);
  }

  final AuthRepository _oAuthRepository;
  final SupabaseAuthRepository _supabaseAuthRepository;
  final UserRepository _userRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// app TODO: 이벤트 버스 패턴 적용
  void _onKaKaoLogin(
    KaKaoLoginRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(stateType: BaseStateType.inProgress));

    final Result<OAuthApiDto> authApiResponse = await _oAuthRepository.login();

    authApiResponse.when(
      ok: (authApiResponse) async {
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

    final Result<UserProfileEntity> userProfileResponse =
        await _userRepository.fetchUserProfile();

    UserProfileEntity? userProfileEntity;

    userProfileResponse.when(
      ok: (entity) {
        userProfileEntity = entity;
      },
      exception: (error) {
        /// app TODO Exception 처리
      },
    );

    supabaseAuthResponse.when(
      ok: (supabaseResponse) {
        final UserEntity userEntity = event.userEntity.copyWith(
          uid: userProfileEntity!.userUid,
          email: supabaseResponse.user?.email,
          profileImage: userProfileEntity!.photoUrl,
          nickName: userProfileEntity!.nickname,
          intro: userProfileEntity!.intro,
          age: userProfileEntity!.age,
          gender: userProfileEntity!.gender,
        );
        final AuthTokenEntity authTokenEntity = event.authTokenEntity.copyWith(
          accessToken: supabaseResponse.session?.accessToken,
        );

        if (!userProfileEntity!.agreeTermsOfService ||
            !userProfileEntity!.agreeAgeOver14 ||
            !userProfileEntity!.agreePrivacyPolicy) {
          emit(AgreementRequiredState(userEntity, authTokenEntity));
          return;
        }

        if (userEntity.gender == Gender.other) {
          emit(ProfileInfoRequiredState(userEntity, authTokenEntity));
          return;
        }

        emit(LoginSuccessState(userEntity, authTokenEntity));
      },
      exception: (error) {
        getIt<AppLogger>().error(error.toString());
        emit(SupabaseLoginFailureState(message: error.toString()));
      },
    );
  }

  void _onAdminLogin(
    AdminLoginRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    final Result<supabase.AuthResponse> supabaseAuthResponse =
        await _supabaseAuthRepository.loginWithEmail(
          email: event.email,
          password: event.password,
        );

    /// app TODO: API 연동
    supabaseAuthResponse.when(
      ok: (supabaseResponse) {
        emit(
          LoginSuccessState(
            UserEntity(
              email: supabaseResponse.user?.email ?? '',
              uid: '',
              loginType: LoginType.email,
              profileImage: '',
              nickName: '',
              age: 0,
              intro: '',
              gender: Gender.male,
            ),
            AuthTokenEntity(
              accessToken: supabaseResponse.session?.accessToken ?? '',
            ),
          ),
        );
      },
      exception: (error) {
        getIt<AppLogger>().error(error.toString());
      },
    );
  }

  void _onUserProfileUpdate(
    UserUpdateRequestEvent event,
    Emitter<AuthState> emit,
  ) {
    if (state.userEntity == null) {
      emit(
        const AuthState(
          stateType: BaseStateType.failure,
          errorMessage: StringConst.notLoggedInMessage,
        ),
      );
    }

    emit(state.copyWith(userEntity: event.userEntity));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
