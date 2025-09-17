import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primary),
    );
  }
}
