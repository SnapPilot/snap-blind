import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_blind/core/router/route_enum.dart';
import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/bloc/auth/auth_bloc.dart';
import 'package:snap_blind/presenter/bloc/auth/auth_event.dart';
import 'package:snap_blind/presenter/bloc/auth/auth_state.dart';
import 'package:snap_blind/presenter/const/asset_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';

final class LoginScreen extends BaseScreen<AuthBloc, AuthState> {
  const LoginScreen({super.key});

  @override
  Widget buildScreen(BuildContext context, AuthState state) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.push(AppRoute.home.path);
        }
      },
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Spacer(), _AppLogoArea(), Spacer(), _KaKaoLoginBtn()],
      ),
    );
  }

  @override
  bool get wrapWithSafeArea => true;

  @override
  Color? get unSafeAreaColor => AppColors.white;
}

final class _AppLogoArea extends StatelessWidget {
  const _AppLogoArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: SvgPicture.asset(AssetConst.appLogoPath)),
        const SizedBox(height: 16),
        Text(
          '5060 소개팅 매칭 서비스',
          style: AppTextStyle.m20.copyWith(color: AppColors.cGray600),
        ),
      ],
    );
  }
}

final class _KaKaoLoginBtn extends StatelessWidget {
  const _KaKaoLoginBtn();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: GestureDetector(
        onTap: () {
          context.read<AuthBloc>().add(LoginRequestEvent());
        },
        child: Image.asset(AssetConst.kakaoLoginBtnPath),
      ),
    );
  }
}
