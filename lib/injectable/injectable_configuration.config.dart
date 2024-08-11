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

import '../data/data_sources/public_api/remote_data_sources.dart' as _i354;
import '../data/module/network_module.dart' as _i434;
import '../data/repository/public_api/public_api_repository_impl.dart' as _i883;
import '../data/repository/re_mapper/api_remapper.dart' as _i462;
import '../domain/services/public_api/public_api_services.dart' as _i614;
import '../domain/usecases/public_api/get_api_usecase.dart' as _i572;
import '../presentation/cubits/app_theme/app_theme_cubit.dart' as _i362;
import '../presentation/public_api/cubits/public_api/cubit.dart' as _i750;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i362.AppThemeCubit>(() => _i362.AppThemeCubit());
    gh.lazySingleton<_i462.ApiReMapper>(() => _i462.ApiReMapper());
    gh.singleton<_i361.Dio>(
      () => networkModule.getUnAuthenticatedDio(),
      instanceName: 'unauthenticated',
    );
    gh.lazySingleton<_i354.RemoteDataSources>(() => _i354.RemoteDataSources(
        gh<_i361.Dio>(instanceName: 'unauthenticated')));
    gh.factory<_i614.PublicApiServices>(() => _i883.PublicApiImpl(
          gh<_i462.ApiReMapper>(),
          gh<_i354.RemoteDataSources>(),
        ));
    gh.factory<_i572.GetApiUseCase>(
        () => _i572.GetApiUseCase(gh<_i614.PublicApiServices>()));
    gh.factory<_i750.PublicApiCubit>(
        () => _i750.PublicApiCubit(getApiUseCase: gh<_i572.GetApiUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i434.NetworkModule {}
