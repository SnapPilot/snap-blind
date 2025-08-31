import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_blind/presenter/auth/auth_bloc.dart';
import 'package:snap_blind/presenter/auth/auth_state.dart';
import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/base/base_stateless_screen.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';
import 'package:snap_blind/presenter/user/user_bloc.dart';
import 'package:snap_blind/presenter/user/user_event.dart';
import 'package:snap_blind/presenter/user/user_state.dart';
import 'package:snap_blind/presenter/widget/app_divider.dart';
import 'package:snap_blind/presenter/widget/labeled_text_form_field.dart';

final class MyInfoScreen extends BaseStatelessScreen {
  const MyInfoScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return Column(
      children: [
        const _MyInfoArea(),
        const AppDivider(thickness: 8, color: AppColors.cGray50),
        _MenuItem(text: StringConst.settingAlarm, onTap: () {}),
        Expanded(
          child: Container(width: double.infinity, color: AppColors.cGray50),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 76,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            StringConst.myInfo,
            style: AppTextStyle.sb20.copyWith(color: AppColors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      actions: const [Icon(Icons.settings, size: 24)],
    );
  }
}

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

class _MenuItem extends StatelessWidget {
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
              size: 14,
              color: AppColors.cGray400,
            ),
          ],
        ),
      ),
    );
  }
}

final class _UserInfoEditBottomSheet
    extends BaseScreen<UserBloc, UserEditState> {
  const _UserInfoEditBottomSheet();

  @override
  Color? get screenBackgroundColor => Colors.transparent;

  @override
  Color? get unSafeAreaColor => Colors.transparent;

  @override
  bool get showErrorPage => false;

  @override
  void onStateChanged(BuildContext context, UserEditState state) {
    if (state.stateType == BaseStateType.success) {
      context.pop();
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
  }

  Future<void> showEditProfileBottomSheet(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return showModalBottomSheet(
      context: context,
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
    final UserBloc userEditBloc = context.read<UserBloc>();

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
                  userEditBloc.add(const UserUpdateRequested());
                },
                child: Text(
                  StringConst.save,
                  style: AppTextStyle.b16.copyWith(color: AppColors.cGray500),
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
              const Icon(Icons.person, size: 56, color: Colors.black38),
              const SizedBox(height: 24),
              LabeledTextFormField(
                textEditingController: userEditBloc.nameController,
                label: StringConst.nickName,
                hintText: StringConst.nameHint,
              ),
              const SizedBox(height: 20),
              Text(
                StringConst.gender,
                style: AppTextStyle.sb12.copyWith(color: AppColors.cGray600),
              ),
              DropdownButtonFormField2<Gender>(
                value: state.gender,
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
                onChanged: (g) {},
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
                onChanged: (v) {},
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              LabeledTextFormField(
                textEditingController: userEditBloc.introController,
                label: StringConst.intro,
                hintText: StringConst.introHint,
                onChanged: (v) {},
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
