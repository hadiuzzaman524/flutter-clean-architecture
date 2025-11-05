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

import '../../data/data_source/user/user_remote_data_source.dart' as _i875;
import '../../data/repository_impl/user/user_repository_impl.dart' as _i339;
import '../../domain/repository/user/user_repository.dart' as _i183;
import '../../domain/use_cases/user/get_user_list_use_case.dart' as _i596;
import '../home/cubits/user_cubit.dart' as _i959;
import 'module.dart' as _i946;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.singleton<_i361.Dio>(
      () => networkModule.unAuthenticatedDio,
      instanceName: 'unauthenticated',
    );
    gh.singleton<_i361.Dio>(
      () => networkModule.authenticatedDio,
      instanceName: 'authenticated',
    );
    gh.singleton<_i875.UserRemoteDataSource>(
      () => _i875.UserRemoteDataSource.new(
        gh<_i361.Dio>(instanceName: 'unauthenticated'),
      ),
    );
    gh.singleton<_i183.UserRepository>(
      () => _i339.UserRepositoryImpl(gh<_i875.UserRemoteDataSource>()),
    );
    gh.singleton<_i596.GetUserListUseCase>(
      () => _i596.GetUserListUseCase(gh<_i183.UserRepository>()),
    );
    gh.factory<_i959.UserCubit>(
      () => _i959.UserCubit(gh<_i596.GetUserListUseCase>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i946.NetworkModule {}
