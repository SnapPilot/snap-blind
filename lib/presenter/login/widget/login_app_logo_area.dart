part of '../login_screen.dart';

final class _LoginAppLogoArea extends StatefulWidget {
  const _LoginAppLogoArea();

  @override
  State<_LoginAppLogoArea> createState() => _LoginAppLogoAreaState();
}

final class _LoginAppLogoAreaState extends State<_LoginAppLogoArea> {
  bool _didDoubleTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onDoubleTap: () {
        _didDoubleTap = true;
      },
      onLongPress: () async {
        if (_didDoubleTap) {
          _didDoubleTap = false;
          final bool? isAdmin = await showDialog<bool>(
            context: context,
            builder: (_) => const AdminModeDialog(),
          );

          if (isAdmin == true && context.mounted) {
            context.push(AppRoute.adminLogin.path);
          }
          return;
        }
      },
      child: Column(
        children: [
          Center(child: SvgPicture.asset(AssetConst.appLogoPath)),
          const SizedBox(height: 16),
          Text(
            '5060 소개팅 매칭 서비스',
            style: AppTextStyle.m20.copyWith(color: AppColors.cGray600),
          ),
        ],
      ),
    );
  }
}
