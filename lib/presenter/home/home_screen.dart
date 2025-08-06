import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_blind/presenter/base/base_screen.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_bloc.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_event.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_state.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:snap_blind/presenter/theme/app_text.dart';

import '../../domain/recipe/entity/recipe_entity.dart';
import '../base/base_state.dart';

final class HomeScreen extends BaseScreen<RecipeBloc, RecipeState> {
  const HomeScreen({super.key});

  @override
  void onBlocCreated(RecipeBloc bloc) {
    bloc.add(RecipeRequestedEvent());
  }

  @override
  Widget buildScreen(BuildContext context, RecipeState state) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return CustomScrollView(
      slivers: [
        SliverPadding(padding: const EdgeInsets.only(top: 24)),
        SliverToBoxAdapter(
          child: Column(
            children: [
              _FeaturedList(),
              SizedBox(height: 24),
              _CategoryArea(),
              SizedBox(height: 24),
              _PopularRecipeArea(),
              SizedBox(height: bottomPadding),
            ],
          ),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: double.infinity,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.wb_sunny_outlined,
                  size: 20,
                  color: AppColors.ff4D8194,
                ),
                SizedBox(width: 4),
                Text(
                  'Good Morning',
                  style: AppTextStyle.rText14.apply(color: AppColors.ff0A2533),
                ),
                Spacer(),
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 24,
                  color: AppColors.black,
                ),
              ],
            ),
            SizedBox(height: 3),
            Text(
              'Alena Sabyan',
              style: AppTextStyle.bText20.apply(color: AppColors.ff0A2533),
            ),
          ],
        ),
      ),
    );
  }
}

final class _FeaturedList extends StatelessWidget {
  const _FeaturedList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state.stateType == BaseStateType.success) {
          final List<RecipeEntity> recipes = state.recipes;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('Featured', style: AppTextStyle.bText20),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: 172,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 24),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 172,
                      width: 264,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.transparent,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          recipes[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                  itemCount: recipes.length,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

final class _CategoryArea extends StatelessWidget {
  const _CategoryArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Category', style: AppTextStyle.bText18),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: AppTextStyle.bText14.apply(color: AppColors.secondary),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 41,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: AppColors.secondary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 9,
                  ),
                  child: Text(
                    'Food',
                    style: AppTextStyle.rText14.apply(color: AppColors.white),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}

final class _PopularRecipeArea extends StatelessWidget {
  const _PopularRecipeArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Popular Recipes', style: AppTextStyle.bText18),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: AppTextStyle.bText14.apply(color: AppColors.secondary),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 248,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 4, bottom: 8),
            itemBuilder: (context, index) {
              return Container(
                height: 240,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          width: 168,
                          height: 128,
                          'https://health.chosun.com/site/data/img_dir/2023/07/17/2023071701753_0.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Spaghetti Carbonara\nsadpaskdopakdpoakspo',
                        style: AppTextStyle.bText14.apply(
                          color: AppColors.ff0A2533,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department_outlined,
                            size: 16,
                            color: AppColors.ff97A2B0,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '120 Kcal',
                            style: AppTextStyle.rText12.apply(
                              color: AppColors.ff97A2B0,
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.circle,
                              size: 4,
                              color: AppColors.ff97A2B0,
                            ),
                          ),
                          Icon(
                            Icons.access_time_outlined,
                            size: 16,
                            color: AppColors.ff97A2B0,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '30 min',
                            style: AppTextStyle.rText12.apply(
                              color: AppColors.ff97A2B0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
