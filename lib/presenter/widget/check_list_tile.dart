import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';

class CheckListTile extends StatefulWidget {
  const CheckListTile({
    super.key,
    required this.label,
    this.value,
    this.initialValue = false,
    this.onChanged,
    this.showTrailing = true,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.cGray300,
    this.onTap,
  }) : assert(
         value == null || onChanged != null,
         'When providing a controlled `value`, you must also provide `onChanged`.',
       );

  final String label;
  final bool? value;
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final bool showTrailing;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback? onTap;

  @override
  State<CheckListTile> createState() => _CheckListTileState();
}

class _CheckListTileState extends State<CheckListTile> {
  late bool _isChecked;

  bool get _effectiveChecked => widget.value ?? _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant CheckListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && oldWidget.initialValue != widget.initialValue) {
      _isChecked = widget.initialValue;
    }
  }

  void _toggle() {
    final next = !_effectiveChecked;
    if (widget.value == null) {
      setState(() => _isChecked = next);
    }
    widget.onChanged?.call(next);
  }

  @override
  Widget build(BuildContext context) {
    final checked = _effectiveChecked;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _toggle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(
              Icons.check_rounded,
              color: checked ? widget.activeColor : widget.inactiveColor,
              size: 24,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(widget.label, style: AppTextStyle.r16)),
            if (widget.showTrailing)
              GestureDetector(
                onTap: widget.onTap,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.cGray300,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
