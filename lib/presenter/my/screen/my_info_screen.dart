import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_blind/presenter/auth/auth_bloc.dart';
import 'package:snap_blind/presenter/auth/auth_state.dart';
import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/base/base_stateless_screen.dart';
import 'package:snap_blind/presenter/const/asset_const.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';
import 'package:snap_blind/presenter/user/user_bloc.dart';
import 'package:snap_blind/presenter/user/user_event.dart';
import 'package:snap_blind/presenter/user/user_state.dart';
import 'package:snap_blind/presenter/widget/app_divider.dart';
import 'package:snap_blind/presenter/widget/labeled_text_form_field.dart';

part '../scaffold/my_info_scaffold.dart';
part '../widget/menu_item.dart';
part '../widget/menu_item_area.dart';
part '../widget/my_info_area.dart';
part '../widget/my_info_coin_button.dart';
part '../widget/user_info_edit_bottom_sheet.dart';

final class MyInfoScreen extends BaseStatelessScreen {
  const MyInfoScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return const _Scaffold(
      myInfoArea: _MyInfoArea(),
      coinButton: _MyInfoCoinButton(),
      menuItemArea: _MenuItemArea(),
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
