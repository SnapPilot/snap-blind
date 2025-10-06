import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.label,
    this.labelTextStyle,
    this.size = 24,
  });

  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final String? label;
  final TextStyle? labelTextStyle;
  final double size;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.initialValue;
  }

  void _toggle() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onChanged(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      behavior: HitTestBehavior.translucent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _isSelected ? AppColors.primary : AppColors.cGray300,
                width: 2,
              ),
            ),
            child:
                _isSelected
                    ? Center(
                      child: Container(
                        width: widget.size / 2,
                        height: widget.size / 2,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                    : null,
          ),
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.label!,
                style: widget.labelTextStyle ?? AppTextStyle.sb18,
              ),
            ),
        ],
      ),
    );
  }
}
