import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/data/recipe/data_source/remote/dummy/dummy_recipe_data_source.dart';
import 'package:snap_blind/data/recipe/dto/remote/dummy/dummy_recipe_req_dto.dart';
import 'package:snap_blind/data/recipe/dto/remote/dummy/dummy_recipe_res_dto.dart';
import 'package:snap_blind/domain/recipe/entity/recipe_entity.dart';
import 'package:snap_blind/domain/recipe/repository/recipe_repository.dart';

@LazySingleton(as: RecipeRepository)
final class RecipeRemoteRepositoryImpl implements RecipeRepository {
  RecipeRemoteRepositoryImpl({required this.recipeApi});

  final DummyRecipeDataSource recipeApi;

  @override
  Future<Result<List<RecipeEntity>>> getRecipes({
    required int limit,
    int? skip,
    String? select,
  }) async {
    final DummyRecipeReqDto dummyRecipeReqDto = DummyRecipeReqDto(
      limit: limit,
      skip: skip,
      select: select,
    );

    final Result<DummyRecipeResDto> recipeRes = await recipeApi.getRecipes(
      dummyRecipeReqDto.toJson(),
    );

    return recipeRes.when(
      ok: (dto) => Result.ok(dto.recipes.map((e) => e.toEntity()).toList()),
      exception: (error) => Result.error(error),
    );
  }
}
