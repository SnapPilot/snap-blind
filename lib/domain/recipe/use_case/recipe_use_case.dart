import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/domain/recipe/entity/recipe_entity.dart';
import 'package:snap_blind/domain/recipe/repository/recipe_repository.dart';

///  Use Case는 하나의 ViewModel에서 여러 레포지토리를 참고할 때 사용하는게 좋음
///  그렇지 않으면 엔지니어링 비용 증가 및 프로젝트 구조 복잡도 증가
///  해당 프로젝트에서는 예시용

@injectable
final class GetRecipes {
  GetRecipes({required this.repository});

  final RecipeRepository repository;

  Future<Result<List<RecipeEntity>>> getRecipes({
    int limit = 10,
    int? skip,
    String? select,
  }) async {
    final Result<List<RecipeEntity>> response = await repository.getRecipes(
      limit: limit,
      skip: skip,
      select: select,
    );

    return response.when(
      ok: (entities) => Result.ok(entities),
      exception: (error) => Result.error(error),
    );
  }
}
