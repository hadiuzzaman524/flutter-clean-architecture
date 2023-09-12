// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_sources/public_api/remote_data_sources.dart' as _i6;
import '../data/module/network_module.dart' as _i11;
import '../data/repository/public_api/public_api_repository_impl.dart' as _i8;
import '../data/repository/re_mapper/api_remapper.dart' as _i3;
import '../domain/services/public_api/public_api_services.dart' as _i7;
import '../domain/usecases/public_api/get_api_usecase.dart' as _i9;
import '../presentation/cubits/app_theme/app_theme_cubit.dart' as _i4;
import '../presentation/public_api/cubits/public_api/cubit.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.ApiReMapper>(() => _i3.ApiReMapper());
    gh.factory<_i4.AppThemeCubit>(() => _i4.AppThemeCubit());
    gh.singleton<_i5.Dio>(
      networkModule.getUnAuthenticatedDio(),
      instanceName: 'unauthenticated',
    );
    gh.lazySingleton<_i6.RemoteDataSources>(() =>
        _i6.RemoteDataSources(gh<_i5.Dio>(instanceName: 'unauthenticated')));
    gh.factory<_i7.PublicApiServices>(() => _i8.PublicApiImpl(
          gh<_i3.ApiReMapper>(),
          gh<_i6.RemoteDataSources>(),
        ));
    gh.factory<_i9.GetApiUseCase>(
        () => _i9.GetApiUseCase(gh<_i7.PublicApiServices>()));
    gh.factory<_i10.PublicApiCubit>(
        () => _i10.PublicApiCubit(getApiUseCase: gh<_i9.GetApiUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i11.NetworkModule {}
