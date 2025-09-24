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
import 'package:snap_blind/data/auth/repository/kakao_auth_repository.dart'
    as _i505;
import 'package:snap_blind/data/auth/repository/supabase_auth_repository.dart'
    as _i921;
import 'package:snap_blind/data/auth/source/kakao_auth_data_source.dart'
    as _i41;
import 'package:snap_blind/data/match/repository/match_repository_impl.dart'
    as _i79;
import 'package:snap_blind/data/match/source/supabase_match_data_source.dart'
    as _i95;
import 'package:snap_blind/data/user/repository/user_repository.dart' as _i701;
import 'package:snap_blind/data/user/source/supabase_user_data_source.dart'
    as _i710;
import 'package:snap_blind/domain/auth/repository/auth_repository.dart'
    as _i994;
import 'package:snap_blind/domain/match/repository/match_repository.dart'
    as _i1012;
import 'package:snap_blind/domain/user/repository/user_repository.dart'
    as _i656;
import 'package:snap_blind/presenter/auth/auth_bloc.dart' as _i605;
import 'package:snap_blind/presenter/home/bloc/home_bloc.dart' as _i651;
import 'package:snap_blind/presenter/user/user_bloc.dart' as _i496;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

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
    gh.factory<_i921.SupabaseAuthRepository>(
      () => _i921.SupabaseAuthRepository(),
    );
    gh.factory<_i95.SupabaseMatchDataSource>(
      () => _i95.SupabaseMatchDataSource(),
    );
    gh.factory<_i710.SupabaseUserDataSource>(
      () => _i710.SupabaseUserDataSource(),
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i454.SupabaseClient>(
      () => registerModule.supabaseClient(),
    );
    gh.lazySingleton<_i41.KaKaoAuthDataSource>(
      () => _i41.KaKaoAuthDataSource(),
    );
    gh.lazySingleton<_i382.AppLogger>(
      () => _i1066.DevLogger(),
      registerFor: {_dev},
    );
    gh.factory<_i1012.MatchRepository>(
      () =>
          _i79.MatchRepositoryImpl(source: gh<_i95.SupabaseMatchDataSource>()),
    );
    gh.factory<_i656.UserRepository>(
      () =>
          _i701.UserRepositoryImpl(source: gh<_i710.SupabaseUserDataSource>()),
    );
    gh.lazySingleton<_i382.AppLogger>(
      () => _i1068.ProdLogger(),
      registerFor: {_prod},
    );
    gh.factory<_i496.UserBloc>(
      () => _i496.UserBloc(gh<_i656.UserRepository>()),
    );
    gh.lazySingleton<_i994.AuthRepository>(
      () => _i505.KaKaoAuthRepository(remote: gh<_i41.KaKaoAuthDataSource>()),
    );
    gh.factory<_i651.HomeBloc>(
      () => _i651.HomeBloc(gh<_i1012.MatchRepository>()),
    );
    gh.factory<_i605.AuthBloc>(
      () => _i605.AuthBloc(
        gh<_i994.AuthRepository>(),
        gh<_i921.SupabaseAuthRepository>(),
        gh<_i656.UserRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i407.RegisterModule {}
