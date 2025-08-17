import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_blind/core/router/route_enum.dart';
import 'package:snap_blind/presenter/const/asset_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';

final class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Spacer(), _AppLogoArea(), Spacer(), _KaKaoLoginBtn()],
        ),
      ),
    );
  }
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
          /// app TODO: Login Action
          context.go(AppRoute.home.path);
        },
        child: Image.asset(AssetConst.kakaoLoginBtnPath),
      ),
    );
  }
}
