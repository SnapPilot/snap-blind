part of '../login_screen.dart';

final class _LoginAppLogoArea extends StatelessWidget {
  const _LoginAppLogoArea();

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
