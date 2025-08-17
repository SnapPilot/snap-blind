import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_blind/core/router/route_enum.dart';
import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_bloc.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_state.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text_style.dart';
import 'package:snap_blind/presenter/widget/app_divider.dart';
import 'package:snap_blind/presenter/widget/profile_list_tile.dart';

final class ChatListScreen extends BaseScreen<RecipeBloc, RecipeState> {
  const ChatListScreen({super.key});

  @override
  Widget buildScreen(BuildContext context, RecipeState state) {
    return Column(
      children: [
        const AppDivider(),
        const SizedBox(height: 26),
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 5,
          itemBuilder: (context, index) {
            return const _ChatListTile();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
        child: Text(
          StringConst.chat,
          style: AppTextStyle.sb20.copyWith(color: AppColors.black),
        ),
      ),
    );
  }
}

class _ChatListTile extends StatelessWidget {
  const _ChatListTile();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoute.chat.path);
      },
      child: Row(
        children: [
          Expanded(
            child: ProfileListTile(
              imageSize: 56,
              imageUrl: 'https://picsum.photos/200/300',
              title: '사용자 이름(나이)',
              titleTextStyle: AppTextStyle.sb18.copyWith(
                color: AppColors.cGray700,
              ),
              subTitleTextStyle: AppTextStyle.m14.copyWith(
                color: AppColors.cGray700,
              ),
              subtitle:
                  '설명 어쩌구 저쩌구 최대 두줄 설명 어쩌구 저쩌구 최대 두줄설명 어쩌구 저쩌구 최대 두줄설명 어쩌구 저쩌구 최대 두줄',
            ),
          ),
          const SizedBox(width: 4),
          Column(
            children: [
              Text(
                "1일전",
                style: AppTextStyle.r16.copyWith(color: AppColors.cGray700),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Text(
                  '3',
                  style: AppTextStyle.m14.copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
