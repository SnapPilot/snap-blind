import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';

final class LabeledTextFormField extends StatelessWidget {
  const LabeledTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.isRequired = false,
    this.textEditingController,
    this.onChanged,
    this.keyboardType,
  });

  final String label;
  final bool isRequired;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppTextStyle.sb12.copyWith(color: AppColors.cGray600),
            ),
            if (isRequired)
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  StringConst.star,
                  style: AppTextStyle.sb12.copyWith(color: AppColors.redEF3F55),
                ),
              ),
          ],
        ),
        TextFormField(
          controller: textEditingController,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.cGray300),
            ),
            hintStyle: AppTextStyle.r18.copyWith(color: AppColors.cGray500),
          ),
        ),
      ],
    );
  }
}
