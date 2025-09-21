import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snap_blind/presenter/auth/auth_bloc.dart';
import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/const/asset_const.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/home/bloc/home_bloc.dart';
import 'package:snap_blind/presenter/home/event/home_event.dart';
import 'package:snap_blind/presenter/home/state/home_state.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';
import 'package:snap_blind/presenter/widget/app_button.dart';
import 'package:snap_blind/presenter/widget/app_circular_progress_indicator.dart';
import 'package:snap_blind/presenter/widget/app_error_widget.dart';
import 'package:snap_blind/presenter/widget/profile_list_tile.dart';

part '../scaffold/home_scaffold.dart';
part '../widget/partner_info_area.dart';
part '../widget/today_not_macthed_area.dart';

final class HomeScreen extends BaseScreen<HomeBloc, HomeState> {
  const HomeScreen({super.key});

  @override
  void onBlocCreated(HomeBloc bloc) {
    super.onBlocCreated(bloc);
    bloc.add(GetTodayMatchPartnerProfileEvent());
  }

  @override
  Widget buildScreen(BuildContext context, HomeState state) {
    return switch (state) {
      PartnerProfileLoadSuccess() => const _Scaffold(
        partnerInfoArea: _PartnerInfoArea(),
        chatButton: AppButton(buttonText: StringConst.startChat),
      ),
      PartnerProfileLoading() => const AppCircularProgressIndicator(),
      PartnerProfileLoadFailure(:final String errorMessage) => AppErrorWidget(
        errorMessage,
      ),
      TodayNotMatched() => const _TodayNotMatchedArea(),
      _ => const SizedBox.shrink(),
    };
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
