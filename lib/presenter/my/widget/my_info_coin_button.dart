part of '../screen/my_info_screen.dart';

final class _MyInfoCoinButton extends StatelessWidget {
  const _MyInfoCoinButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      width: double.infinity,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFFF9D9D),
            Color(0xFFFD7684),
            Color(0xFFFD7684),
            Color(0xFFFA5667),
          ],
          stops: [0.0, 0.32, 0.56, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConst.chatCostInfo,
                  style: AppTextStyle.b20.copyWith(
                    color: AppColors.primarySecondary,
                  ),
                ),
                Text(
                  StringConst.buyCoin,
                  style: AppTextStyle.b20.copyWith(color: AppColors.cGray50),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(AssetConst.coinIconPath, width: 20, height: 20),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: AppColors.white, size: 32),
          ],
        ),
      ),
    );
  }
}
