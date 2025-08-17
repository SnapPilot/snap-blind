import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.imageSize = 94,
    this.titleTextStyle,
    this.subTitleTextStyle,
    this.padding,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final double imageSize;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 12, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.network(
              imageUrl,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      titleTextStyle ??
                      AppTextStyle.m18.copyWith(color: AppColors.cGray900),
                ),
                Text(
                  subtitle,
                  style:
                      subTitleTextStyle ??
                      AppTextStyle.r16.copyWith(color: AppColors.cGray700),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
