import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({
    super.key,
    this.value,
    this.initialValue = false,
    required this.onChanged,
    this.label,
    this.labelTextStyle,
    this.size = 24,
    this.enabled = true,
  });

  final bool? value;
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final String? label;
  final TextStyle? labelTextStyle;
  final double size;
  final bool enabled;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  late bool _internalSelected;

  bool get _effectiveSelected => widget.value ?? _internalSelected;

  @override
  void initState() {
    super.initState();
    _internalSelected = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant RadioButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && oldWidget.initialValue != widget.initialValue) {
      _internalSelected = widget.initialValue;
    }
  }

  void _toggle() {
    if (!widget.enabled) return;
    final bool next = !_effectiveSelected;

    if (widget.value == null) {
      setState(() => _internalSelected = next);
    }

    widget.onChanged(next);
  }

  @override
  Widget build(BuildContext context) {
    final bool selected = _effectiveSelected;
    final Color borderColor = selected ? AppColors.primary : AppColors.cGray300;
    const Color dotColor = AppColors.primary;

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
              border: Border.all(color: borderColor, width: 2),
            ),
            child:
                selected
                    ? Center(
                      child: Container(
                        width: widget.size / 2,
                        height: widget.size / 2,
                        decoration: const BoxDecoration(
                          color: dotColor,
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
