part of '../login_screen.dart';

final class _Scaffold extends StatelessWidget {
  const _Scaffold({required this.appLogoArea, required this.kakaoLoginButton});

  final Widget appLogoArea;
  final Widget kakaoLoginButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [const Spacer(), appLogoArea, const Spacer(), kakaoLoginButton],
    );
  }
}
