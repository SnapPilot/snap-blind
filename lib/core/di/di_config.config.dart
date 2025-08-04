// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:snap_blind/core/di/register_module.dart' as _i407;
import 'package:snap_blind/core/logger/app_logger.dart' as _i382;
import 'package:snap_blind/core/logger/dev_logger.dart' as _i1066;
import 'package:snap_blind/core/logger/prod_logger.dart' as _i1068;
import 'package:snap_blind/data/recipe/data_source/remote/dummy/dummy_recipe_data_source.dart'
    as _i60;
import 'package:snap_blind/data/recipe/repository/recipe_repository_impl.dart'
    as _i784;
import 'package:snap_blind/domain/recipe/repository/recipe_repository.dart'
    as _i73;
import 'package:snap_blind/domain/recipe/use_case/recipe_use_case.dart'
    as _i833;
import 'package:snap_blind/presenter/bloc/recipe/recipe_bloc.dart' as _i479;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i382.AppLogger>(
      () => _i1066.DevLogger(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i60.DummyRecipeDataSource>(
      () => registerModule.recipeApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i73.RecipeRepository>(
      () => _i784.RecipeRemoteRepositoryImpl(
        recipeApi: gh<_i60.DummyRecipeDataSource>(),
      ),
    );
    gh.lazySingleton<_i382.AppLogger>(
      () => _i1068.ProdLogger(),
      registerFor: {_prod},
    );
    gh.factory<_i833.GetRecipes>(
      () => _i833.GetRecipes(repository: gh<_i73.RecipeRepository>()),
    );
    gh.factory<_i479.RecipeBloc>(
      () => _i479.RecipeBloc(gh<_i833.GetRecipes>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i407.RegisterModule {}
