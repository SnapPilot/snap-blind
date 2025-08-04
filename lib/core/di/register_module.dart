import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data/recipe/data_source/remote/dummy/dummy_recipe_data_source.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio();

  @lazySingleton
  DummyRecipeDataSource recipeApi(Dio dio) => DummyRecipeDataSource(dio);
}
