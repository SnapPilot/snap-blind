import 'package:injectable/injectable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/domain/recipe/entity/recipe_entity.dart';
import 'package:snap_blind/domain/recipe/use_case/recipe_use_case.dart';
import 'package:snap_blind/presenter/base/base_bloc.dart';
import 'package:snap_blind/presenter/base/base_state.dart';
import 'package:snap_blind/presenter/bloc/recipe/recipe_event.dart';
import 'recipe_state.dart';

@injectable
final class RecipeBloc extends BaseBloc<RecipeEvent, RecipeState> {
  RecipeBloc(this._recipeUseCase) : super(const RecipeState()) {
    on<RecipeRequestedEvent>(_onLoadRecipes);
  }

  final GetRecipes _recipeUseCase;

  Future<void> _onLoadRecipes(
    RecipeRequestedEvent event,
    Emitter<RecipeState> emit,
  ) async {
    emit(state.copyWith(stateType: BaseStateType.inProgress));

    final Result<List<RecipeEntity>> recipes =
        await _recipeUseCase.getRecipes();

    recipes.when(
      ok: (recipes) {
        emit(
          state.copyWith(stateType: BaseStateType.success, recipes: recipes),
        );
      },
      exception: (error) {
        emit(state.copyWith(stateType: BaseStateType.failure));
      },
    );
  }
}
