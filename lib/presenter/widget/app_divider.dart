import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';

final class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.thickness,
    this.color = AppColors.cGray200,
    this.indent,
  });

  final double? thickness;
  final Color color;
  final double? indent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
      indent: indent,
      endIndent: indent,
    );
  }
}
