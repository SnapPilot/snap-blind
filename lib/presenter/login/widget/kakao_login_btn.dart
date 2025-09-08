part of '../login_screen.dart';

final class _KaKaoLoginBtn extends StatelessWidget {
  const _KaKaoLoginBtn();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: GestureDetector(
        onTap: () {
          context.read<AuthBloc>().add(KaKaoLoginRequestEvent());
        },
        child: Image.asset(AssetConst.kakaoLoginBtnPath),
      ),
    );
  }
}
