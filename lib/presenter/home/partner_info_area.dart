part of 'home_screen.dart';

final class _PartnerInfoArea extends StatelessWidget {
  const _PartnerInfoArea({required this.partnerEntity});

  final PartnerEntity partnerEntity;

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
          const SizedBox(height: 4),
          ProfileListTile(
            imageUrl: partnerEntity.profileUrl,
            title: '${partnerEntity.nickname}(나이)',
            subtitle:
                '설명 어쩌구 저쩌구 최대 두줄 설명 어쩌구 저쩌구 최대 두줄설명 어쩌구 저쩌구 최대 두줄설명 어쩌구 저쩌구 최대 두줄',
          ),
          const AppButton(buttonText: StringConst.startChat),
        ],
      ),
    );
  }
}
