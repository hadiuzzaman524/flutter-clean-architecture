// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_source/user/user_remote_data_source.dart' as _i875;
import '../../data/repository_impl/auth/auth_repository_impl.dart' as _i747;
import '../../data/repository_impl/user/user_repository_impl.dart' as _i339;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/repository/user/user_repository.dart' as _i183;
import '../../domain/use_cases/auth/login_use_case.dart' as _i40;
import '../../domain/use_cases/auth/signup_use_case.dart' as _i86;
import '../../domain/use_cases/user/get_user_list_use_case.dart' as _i596;
import '../../presentation/screen/auth/login/cubit/login_cubit.dart' as _i549;
import '../../presentation/screen/auth/sign_up/cubit/signup_cubit.dart' as _i21;
import '../../presentation/screen/home/cubits/user_cubit.dart' as _i164;
import 'module.dart' as _i946;

const String _staging = 'staging';
const String _development = 'development';
const String _production = 'production';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<String>(() => networkModule.baseURL);
    gh.singleton<_i912.AuthRepository>(() => _i747.AuthRepositoryImpl());
    gh.singleton<_i361.Dio>(
      () => networkModule.unAuthenticatedStgDio,
      instanceName: 'unauthenticated',
      registerFor: {_staging},
    );
    gh.singleton<_i361.Dio>(
      () => networkModule.authenticatedDio,
      instanceName: 'authenticated',
    );
    gh.singleton<_i361.Dio>(
      () => networkModule.unAuthenticatedDevDio,
      instanceName: 'unauthenticated',
      registerFor: {_development},
    );
    gh.singleton<_i40.LoginUseCase>(
      () => _i40.LoginUseCase(gh<_i912.AuthRepository>()),
    );
    gh.singleton<_i86.SignupUseCase>(
      () => _i86.SignupUseCase(gh<_i912.AuthRepository>()),
    );
    gh.singleton<_i361.Dio>(
      () => networkModule.unAuthenticatedProdDio,
      instanceName: 'unauthenticated',
      registerFor: {_production},
    );
    gh.singleton<_i875.UserRemoteDataSource>(
      () => _i875.UserRemoteDataSource(
        gh<_i361.Dio>(instanceName: 'unauthenticated'),
      ),
    );
    gh.singleton<_i183.UserRepository>(
      () => _i339.UserRepositoryImpl(gh<_i875.UserRemoteDataSource>()),
    );
    gh.singleton<_i596.GetUserListUseCase>(
      () => _i596.GetUserListUseCase(gh<_i183.UserRepository>()),
    );
    gh.factory<_i549.LoginCubit>(
      () => _i549.LoginCubit(gh<_i40.LoginUseCase>()),
    );
    gh.factory<_i21.SignupCubit>(
      () => _i21.SignupCubit(gh<_i86.SignupUseCase>()),
    );
    gh.factory<_i164.UserCubit>(
      () => _i164.UserCubit(gh<_i596.GetUserListUseCase>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i946.NetworkModule {}
