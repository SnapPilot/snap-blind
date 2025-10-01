part of '../screen/my_info_screen.dart';

final class _UserInfoEditBottomSheet
    extends BaseScreen<UserEditBloc, UserEditState> {
  const _UserInfoEditBottomSheet();

  @override
  Color? get screenBackgroundColor => Colors.transparent;

  @override
  Color? get unSafeAreaColor => Colors.transparent;

  @override
  bool get showErrorPage => false;

  @override
  void onBlocCreated(UserEditBloc bloc) {
    bloc.add(const UserInitializeRequested());
    super.onBlocCreated(bloc);
  }

  @override
  void onStateChanged(BuildContext context, UserEditState state) {
    if (state.stateType == BaseStateType.initial) {
      context.read<UserEditBloc>().add(
        UserInitialized(context.read<AuthBloc>().state.userEntity!),
      );
      return;
    }

    if (state.stateType == BaseStateType.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage ?? StringConst.defaultErrorMessage),
        ),
      );
      return;
    }

    if (state is UserEditSuccessState) {
      context.read<AuthBloc>().add(UserUpdateRequestEvent(state.userEntity!));
      return;
    }

    if (state.stateType is UserProfileImagePickFailedState) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(StringConst.userProfileImagePickedErrorMessage),
        ),
      );
      return;
    }
  }

  Future<void> showEditProfileBottomSheet(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      constraints: BoxConstraints(maxHeight: size.height * 0.82),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (ctx) {
        return this;
      },
    );
  }

  @override
  Widget buildScreen(BuildContext context, UserEditState state) {
    final UserEditBloc userEditBloc = context.read<UserEditBloc>();

    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          width: 58,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.cGray200,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.close,
                  color: AppColors.cGray900,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                StringConst.editProfile,
                style: AppTextStyle.sb16.copyWith(color: AppColors.cGray900),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (userEditBloc.state is! UserEditChangedState) {
                    return;
                  }
                  userEditBloc.add(
                    UserUpdateRequested(
                      uid: context.read<AuthBloc>().state.userEntity!.uid,
                      imageFile: userEditBloc.state.profileImage,
                    ),
                  );
                },
                child: Text(
                  StringConst.save,
                  style: AppTextStyle.b16.copyWith(
                    color:
                        userEditBloc.state is UserEditChangedState
                            ? AppColors.primary
                            : AppColors.cGray500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const AppDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const _ProfileAvatarWidget(),
              const SizedBox(height: 30),
              LabeledTextFormField(
                textEditingController: userEditBloc.nameController,
                label: StringConst.nickName,
                hintText: StringConst.nameHint,
                isRequired: true,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    StringConst.gender,
                    style: AppTextStyle.sb12.copyWith(
                      color: AppColors.cGray600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      StringConst.star,
                      style: AppTextStyle.sb12.copyWith(
                        color: AppColors.redEF3F55,
                      ),
                    ),
                  ),
                ],
              ),
              DropdownButtonFormField2<Gender>(
                value: state.userEntity?.gender,
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.cGray300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.cGray300),
                  ),
                ),
                hint: Text(
                  StringConst.genderHint,
                  style: AppTextStyle.r18.copyWith(color: AppColors.cGray500),
                ),
                items: _buildDropDownItems(),
                onChanged: context.read<UserEditBloc>().changeGenderSelect,
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.zero,
                  height: 48,
                  width: double.infinity,
                ),
                dropdownStyleData: DropdownStyleData(
                  elevation: 2,
                  offset: const Offset(0, -1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.all(16),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.cGray300,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              LabeledTextFormField(
                textEditingController: userEditBloc.ageController,
                label: StringConst.age,
                hintText: StringConst.ageHint,
                keyboardType: TextInputType.number,
                isRequired: true,
              ),
              const SizedBox(height: 20),
              LabeledTextFormField(
                textEditingController: userEditBloc.introController,
                label: StringConst.intro,
                hintText: StringConst.introHint,
                isRequired: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<Gender>> _buildDropDownItems() {
    const List<Gender> list = [Gender.male, Gender.female];

    return list.map((item) {
      return DropdownMenuItem(
        value: item,
        child: Text(
          item.toString(),
          style: AppTextStyle.m14.copyWith(color: AppColors.cGray900),
        ),
      );
    }).toList();
  }
}
