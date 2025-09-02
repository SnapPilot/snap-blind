import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/bloc/auth/auth_bloc.dart';
import 'package:snap_blind/presenter/bloc/auth/auth_state.dart';
import 'package:snap_blind/presenter/const/asset_const.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';
import 'package:snap_blind/presenter/widget/app_button.dart';
import 'package:snap_blind/presenter/widget/profile_list_tile.dart';

final class HomeScreen extends BaseScreen<AuthBloc, AuthState> {
  const HomeScreen({super.key});

  @override
  Widget buildScreen(BuildContext context, AuthState state) {
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
          const ProfileListTile(
            imageUrl: 'https://picsum.photos/200/300',
            title: '사용자 이름(나이)',
            subtitle:
                '설명 어쩌구 저쩌구 최대 두줄 설명 어쩌구 저쩌구 최대 두줄설명 어쩌구 저쩌구 최대 두줄설명 어쩌구 저쩌구 최대 두줄',
          ),
          const AppButton(buttonText: StringConst.startChat),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    const double appIconSize = 24;
    const double leftPadding = 16;

    return AppBar(
      leadingWidth: appIconSize + leftPadding,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SvgPicture.asset(AssetConst.appIconPath),
      ),
    );
  }
}
