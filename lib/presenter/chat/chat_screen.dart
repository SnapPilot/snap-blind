import 'package:flutter/material.dart';
import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_bloc.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_state.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';
import 'package:snap_blind/presenter/widget/app_divider.dart';

final class ChatScreen extends BaseScreen<RecipeBloc, RecipeState> {
  const ChatScreen({super.key});

  @override
  Widget buildScreen(BuildContext context, RecipeState state) {
    return const Column(
      children: [
        _ChatScreenAppBar(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(child: _ChatDateWidget()),
              SliverToBoxAdapter(child: SizedBox(height: 8)),
              SliverToBoxAdapter(child: _ChannelJoinMessageWidget()),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              _ChatListArea(),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
        AppDivider(),
        _ChatInputArea(),
      ],
    );
  }

  @override
  bool get wrapWithSafeArea => true;

  @override
  Color? get unSafeAreaColor => AppColors.white;
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

class _ChatListArea extends StatelessWidget {
  const _ChatListArea();

  @override
  Widget build(BuildContext context) {
    List<String> list = List.generate(5, (index) {
      return StringConst.loremIpsum;
    });

    return SliverList.separated(
      itemBuilder: (context, index) {
        return _MessageWidget(text: list[index], isMine: index % 2 == 0);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 24);
      },
      itemCount: list.length,
      addRepaintBoundaries: true,
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

class _ChatDateWidget extends StatelessWidget {
  const _ChatDateWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cGray500,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Text(
            '2023년 8월 5일',
            style: AppTextStyle.m14.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

class _ChannelJoinMessageWidget extends StatelessWidget {
  const _ChannelJoinMessageWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1,
      child: Text(
        '김퍼그님이 채널에 참가하셨습니다.',
        style: AppTextStyle.r16.copyWith(color: AppColors.cGray600),
      ),
    );
  }
}

class _MessageWidget extends StatelessWidget {
  const _MessageWidget({required this.text, required this.isMine});

  final String text;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = AppTextStyle.m18.copyWith(
      color: isMine ? AppColors.white : AppColors.black,
    );
    final Color backgroundColor =
        isMine ? AppColors.primary : AppColors.cGray100;

    return Row(
      mainAxisAlignment:
          isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isMine) _buildCheckMessageWidget(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          constraints: const BoxConstraints(maxWidth: 280),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft:
                  isMine ? const Radius.circular(16) : const Radius.circular(0),
              bottomRight:
                  isMine ? const Radius.circular(0) : const Radius.circular(16),
            ),
          ),
          child: Text(text, style: textStyle),
        ),
      ],
    );
  }

  Widget _buildCheckMessageWidget() {
    return Row(
      children: [
        const Icon(Icons.done_all, color: AppColors.green, size: 16),
        const SizedBox(width: 4),
        Text('읽음', style: AppTextStyle.m12.copyWith(color: AppColors.cGray600)),
        const SizedBox(width: 4),
      ],
    );
  }
}
