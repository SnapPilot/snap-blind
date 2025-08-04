import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/network/result_call_adapter.dart';
import 'package:snap_blind/data/recipe/dto/remote/dummy/dummy_recipe_res_dto.dart';

part 'dummy_recipe_data_source.g.dart';

@RestApi(baseUrl: "https://dummyjson.com", callAdapter: ResultCallAdapter)
abstract class DummyRecipeDataSource {
  factory DummyRecipeDataSource(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _DummyRecipeDataSource;

  @GET("/recipes")
  Future<Result<DummyRecipeResDto>> getRecipes(
    @Queries() Map<String, dynamic> queries,
  );
}
