import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/domain/recipe/entity/recipe_entity.dart';

abstract interface class RecipeRepository {
  Future<Result<List<RecipeEntity>>> getRecipes({
    required int limit,
    int? skip,
    String? select,
  });
}
