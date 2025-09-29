part of '../screen/my_info_screen.dart';

class _ProfileAvatarWidget extends StatelessWidget {
  const _ProfileAvatarWidget();

  @override
  Widget build(BuildContext context) {
    final XFile? profileImageFile = context.select(
      (UserEditBloc bloc) => bloc.state.profileImage,
    );

    final String? userProfileImage =
        context.read<AuthBloc>().state.userEntity?.profileImage;

    return GestureDetector(
      onTap: () {
        context.read<UserEditBloc>().add(UserProfileImageClicked());
      },
      child: SizedBox(
        width: 64,
        height: 58,
        child: Stack(
          children: [
            (userProfileImage != null)
                ? ClipOval(
                  child: _imageWidget(
                    profileImageUrl: userProfileImage,
                    profileImageFile: profileImageFile,
                  ),
                )
                : Image.asset(
                  AssetConst.muiAvatarIconPath,
                  width: 56,
                  height: 56,
                ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cGray50,
                  border: Border.all(color: AppColors.cGray200, width: 1),
                ),
                child: const Icon(
                  Icons.edit,
                  size: 14,
                  color: AppColors.cGray700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageWidget({
    required String profileImageUrl,
    required XFile? profileImageFile,
  }) {
    if (profileImageFile != null) {
      return Image.file(
        File(profileImageFile.path),
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      );
    }

    return Image.network(
      profileImageUrl,
      width: 56,
      height: 56,
      fit: BoxFit.cover,
    );
  }
}
