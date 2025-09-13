import 'package:flutter/material.dart';

final class AdminModeDialog extends StatefulWidget {
  const AdminModeDialog({super.key});

  @override
  State<AdminModeDialog> createState() => _AdminModeDialogState();
}

final class _AdminModeDialogState extends State<AdminModeDialog> {
  final TextEditingController _controller = TextEditingController();

  void _onConfirm() {
    final input = _controller.text.trim();

    if (input == '4050') {
      Navigator.of(context).pop(true);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('관리자 모드'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: '비밀번호 입력'),
        obscureText: true,
        onSubmitted: (_) => _onConfirm(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('취소'),
        ),
        TextButton(onPressed: () => _onConfirm(), child: const Text('확인')),
      ],
    );
  }
}
