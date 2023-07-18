// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_sources/public_api/remote_data_sources.dart' as _i5;
import '../data/repository/public_api/public_api_repository_impl.dart' as _i7;
import '../domain/repository/public_api/public_api_repository.dart' as _i6;
import '../domain/usecases/public_api/get_api_usecase.dart' as _i8;
import '../presentation/cubits/app_theme/app_theme_cubit.dart' as _i3;
import '../presentation/public_api/cubits/public_api/cubit.dart' as _i9;
import '../services/dio_services.dart' as _i4;

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
    gh.factory<_i3.AppThemeCubit>(() => _i3.AppThemeCubit());
    gh.lazySingleton<_i4.DioService>(() => _i4.DioService());
    gh.singleton<_i5.RemoteDataSources>(_i5.RemoteDataSources());
    gh.factory<_i6.PublicApiRepository>(() => _i7.PublicApiImpl(
        publicApiRemoteDataSource: gh<_i5.RemoteDataSources>()));
    gh.factory<_i8.GetApiUseCase>(() =>
        _i8.GetApiUseCase(publicApiRepository: gh<_i6.PublicApiRepository>()));
    gh.factory<_i9.PublicApiCubit>(
        () => _i9.PublicApiCubit(getApiUseCase: gh<_i8.GetApiUseCase>()));
    return this;
  }
}
