part of '../screen/home_screen.dart';

class _TodayNotMatchedArea extends StatelessWidget {
  const _TodayNotMatchedArea();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            StringConst.todayPartnerMatch,
            style: AppTextStyle.sb20.copyWith(color: AppColors.cGray900),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.cGray50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringConst.todayNotMatchedTitle(
                    context.read<AuthBloc>().state.userEntity?.nickName ?? '',
                  ),
                  style: AppTextStyle.m17.copyWith(color: AppColors.cGray900),
                  textAlign: TextAlign.center,
                ),
                Text(
                  StringConst.todayNotMatchedSubTitle,
                  style: AppTextStyle.m17.copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline, size: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  StringConst.todayNotMatchedInfo,
                  style: AppTextStyle.m14.copyWith(color: AppColors.cGray700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const AppButton(
            buttonText: StringConst.startChat,
            backgroundColor: AppColors.cGray400,
          ),
        ],
      ),
    );
  }
}
