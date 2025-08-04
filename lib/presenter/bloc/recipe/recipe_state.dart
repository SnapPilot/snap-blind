import 'package:flutter/foundation.dart';
import 'package:snap_blind/domain/recipe/entity/recipe_entity.dart';
import 'package:snap_blind/presenter/base/base_state.dart';

@immutable
final class RecipeState extends BaseState {
  const RecipeState({
    super.stateType,
    super.errorMessage,
    this.recipes = const [],
  });

  final List<RecipeEntity> recipes;

  @override
  List<Object?> get props => [...super.props, recipes];

  RecipeState copyWith({
    List<RecipeEntity>? recipes,
    BaseStateType? stateType,
    String? errorMessage,
  }) {
    return RecipeState(
      stateType: stateType ?? this.stateType,
      errorMessage: errorMessage ?? this.errorMessage,
      recipes: recipes ?? this.recipes,
    );
  }
}
