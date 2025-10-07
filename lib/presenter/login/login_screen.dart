import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_blind/core/router/route_enum.dart';
import 'package:snap_blind/presenter/auth/auth_bloc.dart';
import 'package:snap_blind/presenter/auth/auth_event.dart';
import 'package:snap_blind/presenter/auth/auth_state.dart';
import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/const/asset_const.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';
import 'package:snap_blind/presenter/widget/admin_mode_dialog.dart';
import 'package:snap_blind/presenter/widget/app_button.dart';
import 'package:snap_blind/presenter/widget/check_list_tile.dart';
import 'package:snap_blind/presenter/widget/radio_button.dart';

part 'widget/admin_login_screen.dart';
part 'widget/agreement_bottom_sheet.dart';
part 'widget/kakao_login_btn.dart';
part 'widget/login_app_logo_area.dart';
part 'widget/login_scaffold.dart';

final class LoginScreen extends BaseScreen<AuthBloc, AuthState> {
  const LoginScreen({super.key});

  @override
  Widget buildScreen(BuildContext context, AuthState state) {
    return const _Scaffold(
      appLogoArea: _LoginAppLogoArea(),
      kakaoLoginButton: _KaKaoLoginBtn(),
    );
  }

  @override
  void onStateChanged(BuildContext context, AuthState state) {
    if (state is LoginSuccessState) {
      context.go(AppRoute.home.path);
      return;
    }

    if (state is KaKaoLoginSuccessState) {
      context.read<AuthBloc>().add(
        LoginRequestEvent(
          userEntity: state.userEntity!,
          authTokenEntity: state.authTokenEntity!,
        ),
      );
      return;
    }

    if (state is AgreementRequiredState) {
      const _AgreementBottomSheet().show(context);
    }
  }

  @override
  bool get wrapWithSafeArea => true;

  @override
  Color? get unSafeAreaColor => AppColors.white;

  @override
  bool get createNewBlocInstance => false;
}
