part of '../screen/my_info_screen.dart';

final class _MyInfoArea extends StatelessWidget {
  const _MyInfoArea();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
      child: BlocConsumer<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image.network(
                  state.userEntity?.profileImage ?? '',
                  width: 56,
                  height: 56,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                state.userEntity?.nickName ?? StringConst.anonymous,
                style: AppTextStyle.sb20.copyWith(color: AppColors.black),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  const _UserInfoEditBottomSheet().showEditProfileBottomSheet(
                    context,
                  );
                },
                child: Container(
                  width: 106,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.cGray50,
                  ),
                  child: Center(
                    child: Text(
                      StringConst.editProfile,
                      style: AppTextStyle.m16.copyWith(
                        color: AppColors.cGray700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        listener: (BuildContext context, AuthState state) {},
      ),
    );
  }
}
