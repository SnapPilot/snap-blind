import 'package:flutter/widgets.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
