import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_bloc.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_state.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';
import 'package:snap_blind/presenter/widget/app_divider.dart';

final class MyInfoScreen extends BaseScreen<RecipeBloc, RecipeState> {
  const MyInfoScreen({super.key});

  @override
  Widget buildScreen(BuildContext context, RecipeState state) {
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
      child: Row(
        children: [
          const Icon(Icons.account_circle_outlined, size: 56),
          const SizedBox(width: 16),
          Text(
            StringConst.anonymous,
            style: AppTextStyle.sb20.copyWith(color: AppColors.black),
          ),
          const Spacer(),
          Container(
            width: 106,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.cGray50,
            ),
            child: Center(
              child: Text(
                StringConst.modifyProfile,
                style: AppTextStyle.m16.copyWith(color: AppColors.cGray700),
              ),
            ),
          ),
        ],
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
