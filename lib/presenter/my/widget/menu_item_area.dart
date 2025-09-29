part of '../screen/my_info_screen.dart';

final class _MenuItemArea extends StatelessWidget {
  const _MenuItemArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        _MenuItem(text: StringConst.settingAlarm, onTap: () {}),
        const AppDivider(indent: 16),
        _MenuItem(text: StringConst.settingInquiry, onTap: () {}),
        const SizedBox(height: 4),
      ],
    );
  }
}
