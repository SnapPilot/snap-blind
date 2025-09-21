part of '../screen/home_screen.dart';

final class _PartnerInfoArea extends StatelessWidget {
  const _PartnerInfoArea();

  @override
  Widget build(BuildContext context) {
    final PartnerProfileLoadSuccess state =
        context.watch<HomeBloc>().state as PartnerProfileLoadSuccess;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          StringConst.todayPartnerMatch,
          style: AppTextStyle.sb20.copyWith(color: AppColors.cGray900),
        ),
        const SizedBox(height: 4),
        ProfileListTile(
          imageUrl: state.partner.profileUrl,
          title: '${state.partner.nickname}${state.partner.getAge}',
          subtitle: state.partner.intro,
        ),
      ],
    );
  }
}
