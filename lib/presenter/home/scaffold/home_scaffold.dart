part of '../screen/home_screen.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({required this.partnerInfoArea, required this.chatButton});

  final Widget partnerInfoArea;
  final Widget chatButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [partnerInfoArea, chatButton],
      ),
    );
  }
}
