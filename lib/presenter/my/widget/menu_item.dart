part of '../screen/my_info_screen.dart';

final class _MenuItem extends StatelessWidget {
  const _MenuItem({this.text = '', this.onTap});

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 21),
        child: Row(
          children: [
            Text(
              text,
              style: AppTextStyle.m16.copyWith(color: AppColors.black),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 28,
              color: AppColors.cGray400,
            ),
          ],
        ),
      ),
    );
  }
}
