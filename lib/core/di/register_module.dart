import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:snap_blind/data/recipe/source/remote/dummy/dummy_recipe_data_source.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio();

  @lazySingleton
  DummyRecipeDataSource recipeApi(Dio dio) => DummyRecipeDataSource(dio);
}
