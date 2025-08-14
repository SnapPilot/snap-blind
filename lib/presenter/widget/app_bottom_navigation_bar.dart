import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text.dart';

/// * [BottomNavigationBar.unselectedItemColor]를 지정하면
/// * [BottomNavigationBar.unselectedLabelStyle]에 설정한
/// * [TextStyle.color] 값은 우선 순위에 의해 무시 됩니다잉~
class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 22;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.cGray200)),
        ),
        child: Theme(
          data: ThemeData(
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.cGray500,
            currentIndex: navigationShell.currentIndex,
            selectedLabelStyle: AppTextStyle.m14,
            unselectedLabelStyle: AppTextStyle.m14,
            showSelectedLabels: true,
            elevation: 1,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: iconSize),
                label: StringConst.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline, size: iconSize),
                label: StringConst.chat,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined, size: iconSize),
                label: StringConst.my,
              ),
            ],
            onTap: (index) {
              navigationShell.goBranch(index);
            },
          ),
        ),
      ),
    );
  }
}
