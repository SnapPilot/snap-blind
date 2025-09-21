part of '../screen/my_info_screen.dart';

final class _Scaffold extends StatelessWidget {
  const _Scaffold({required this.myInfoArea, required this.menuItemArea});

  final Widget myInfoArea;
  final Widget menuItemArea;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myInfoArea,
        const AppDivider(thickness: 8, color: AppColors.cGray50),
        menuItemArea,
        Expanded(
          child: Container(width: double.infinity, color: AppColors.cGray50),
        ),
      ],
    );
  }
}
