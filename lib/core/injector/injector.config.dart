// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/data_source/auth/mock/auth_mock_data_source.dart' as _i63;
import '../../data/data_source/auth/remote/auth_remote_data_source.dart'
    as _i976;
import '../../data/data_source/base/factory/data_source_factory.dart' as _i718;
import '../../data/data_source/base/factory/data_source_provider.dart' as _i899;
import '../../data/data_source/user/local/subscription_local_data_source.dart'
    as _i280;
import '../../data/data_source/user/local/user_local_data_source.dart' as _i627;
import '../../data/data_source/user/mock/user_mock_data_source.dart' as _i759;
import '../../data/data_source/user/remote/user_remote_data_source.dart'
    as _i118;
import '../../data/repository_impl/auth/auth_repository_impl.dart' as _i747;
import '../../data/repository_impl/user/subscription_repository_impl.dart'
    as _i728;
import '../../data/repository_impl/user/user_cache_repository_impl.dart'
    as _i270;
import '../../data/repository_impl/user/user_repository_impl.dart' as _i339;
import '../../data/repository_impl/user/user_subscription_proxy_repository_impl.dart'
    as _i117;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/repository/user/subscription_repository.dart' as _i465;
import '../../domain/repository/user/user_repository.dart' as _i183;
import '../../domain/use_cases/auth/login_use_case.dart' as _i40;
import '../../domain/use_cases/user/get_subscription_status_use_case.dart'
    as _i128;
import '../../domain/use_cases/user/get_user_list_use_case.dart' as _i596;
import '../../domain/use_cases/user/set_subscription_status_use_case.dart'
    as _i988;
import '../../presentation/screen/auth/login/cubit/login_cubit.dart' as _i549;
import '../../presentation/screen/home/cubits/user_cubit.dart' as _i164;
import '../helper/secure_storage_service.dart' as _i693;
import 'module.dart' as _i946;

const String _development = 'development';
const String _staging = 'staging';
const String _production = 'production';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final storageModule = _$StorageModule();
    final loggerModule = _$LoggerModule();
    final dataSourceProvider = _$DataSourceProvider();
    final userRepositoryModule = _$UserRepositoryModule();
    gh.factory<String>(() => networkModule.baseURL);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => storageModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storageModule.secureStorage,
    );
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.lazySingleton<_i63.AuthMockDataSource>(() => _i63.AuthMockDataSource());
    gh.lazySingleton<_i759.UserMockDataSource>(
      () => _i759.UserMockDataSource(),
    );
    gh.singleton<_i718.DataSourceFactory>(
      () => dataSourceProvider.mockFactory(
        gh<_i759.UserMockDataSource>(),
        gh<_i63.AuthMockDataSource>(),
      ),
      registerFor: {_development},
    );
    gh.lazySingleton<_i693.SecureStorageService>(
      () => _i693.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.singleton<_i361.Dio>(
      () => networkModule.unAuthenticatedStgDio,
      instanceName: 'unauthenticated',
      registerFor: {_staging},
    );
    gh.singleton<_i361.Dio>(
      () => networkModule.authenticatedDio,
      instanceName: 'authenticated',
    );
    gh.lazySingleton<_i627.UserLocalDataSource>(
      () => _i627.UserLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i361.Dio>(
      () => networkModule.unAuthenticatedDevDio,
      instanceName: 'unauthenticated',
      registerFor: {_development},
    );
    gh.singleton<_i361.Dio>(
      () => networkModule.unAuthenticatedProdDio,
      instanceName: 'unauthenticated',
      registerFor: {_production},
    );
    gh.lazySingleton<_i280.SubscriptionLocalDataSource>(
      () => _i280.SubscriptionLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i976.AuthRemoteDataSource>(
      () => _i976.AuthRemoteDataSource(
        gh<_i361.Dio>(instanceName: 'unauthenticated'),
      ),
    );
    gh.lazySingleton<_i118.UserRemoteDataSource>(
      () => _i118.UserRemoteDataSource(
        gh<_i361.Dio>(instanceName: 'unauthenticated'),
      ),
    );
    gh.lazySingleton<_i465.SubscriptionRepository>(
      () => _i728.SubscriptionRepositoryImpl(
        gh<_i280.SubscriptionLocalDataSource>(),
      ),
    );
    gh.singleton<_i718.DataSourceFactory>(
      () => dataSourceProvider.remoteFactory(
        gh<_i118.UserRemoteDataSource>(),
        gh<_i976.AuthRemoteDataSource>(),
      ),
      registerFor: {_production, _staging},
    );
    gh.singleton<_i912.AuthRepository>(
      () => _i747.AuthRepositoryImpl(
        gh<_i718.DataSourceFactory>(),
        gh<_i693.SecureStorageService>(),
      ),
    );
    gh.singleton<_i183.UserRepository>(
      () => _i339.UserRepositoryImpl(gh<_i718.DataSourceFactory>()),
      instanceName: 'remote',
    );
    gh.singleton<_i128.GetSubscriptionStatusUseCase>(
      () => _i128.GetSubscriptionStatusUseCase(
        gh<_i465.SubscriptionRepository>(),
      ),
    );
    gh.singleton<_i988.SetSubscriptionStatusUseCase>(
      () => _i988.SetSubscriptionStatusUseCase(
        gh<_i465.SubscriptionRepository>(),
      ),
    );
    gh.singleton<_i40.LoginUseCase>(
      () => _i40.LoginUseCase(gh<_i912.AuthRepository>()),
    );
    gh.lazySingleton<_i183.UserRepository>(
      () => _i270.UserCacheRepositoryImpl(
        gh<_i183.UserRepository>(instanceName: 'remote'),
        gh<_i627.UserLocalDataSource>(),
      ),
      instanceName: 'cached',
    );
    gh.lazySingleton<_i183.UserRepository>(
      () => userRepositoryModule.cachedUserRepository(
        gh<_i183.UserRepository>(instanceName: 'cached'),
      ),
      registerFor: {_development},
    );
    gh.lazySingleton<_i183.UserRepository>(
      () => _i117.UserSubscriptionProxyRepositoryImpl(
        gh<_i183.UserRepository>(instanceName: 'cached'),
        gh<_i465.SubscriptionRepository>(),
      ),
      registerFor: {_production, _staging},
    );
    gh.singleton<_i596.GetUserListUseCase>(
      () => _i596.GetUserListUseCase(gh<_i183.UserRepository>()),
    );
    gh.factory<_i549.LoginCubit>(
      () => _i549.LoginCubit(gh<_i40.LoginUseCase>(), gh<_i974.Logger>()),
    );
    gh.factory<_i164.UserCubit>(
      () => _i164.UserCubit(
        gh<_i596.GetUserListUseCase>(),
        gh<_i974.Logger>(),
        gh<_i128.GetSubscriptionStatusUseCase>(),
        gh<_i988.SetSubscriptionStatusUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i946.NetworkModule {}

class _$StorageModule extends _i946.StorageModule {}

class _$LoggerModule extends _i946.LoggerModule {}

class _$DataSourceProvider extends _i899.DataSourceProvider {}

class _$UserRepositoryModule extends _i946.UserRepositoryModule {}
