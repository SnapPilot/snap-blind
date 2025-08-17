import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';

final class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: AppColors.cGray200, height: 1);
  }
}
