import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_bloc.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_state.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';
import 'package:snap_blind/presenter/widget/app_divider.dart';

final class ChatScreen extends BaseScreen<RecipeBloc, RecipeState> {
  const ChatScreen({super.key});

  @override
  Widget buildScreen(BuildContext context, RecipeState state) {
    return const Column(
      children: [_ChatScreenAppBar(), Spacer(), AppDivider(), _ChatInputArea()],
    );
  }
}

class _ChatScreenAppBar extends StatelessWidget {
  const _ChatScreenAppBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              const SizedBox(width: 16),
              const BackButton(
                style: ButtonStyle(iconSize: WidgetStatePropertyAll(24)),
              ),
              const SizedBox(width: 8),
              ClipOval(
                child: Image.network(
                  'https://picsum.photos/200/300',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "대화자 이름",
                style: AppTextStyle.sb18.copyWith(color: AppColors.cGray900),
              ),
            ],
          ),
        ),
        const AppDivider(),
      ],
    );
  }
}

class _ChatInputArea extends StatelessWidget {
  const _ChatInputArea();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.image, size: 30, color: AppColors.indigoBlue),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter message",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
