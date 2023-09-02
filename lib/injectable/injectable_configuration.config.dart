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

import '../data/repository/public_api/public_api_repository_impl.dart' as _i7;
import '../data/repository/re_mapper/api_remapper.dart' as _i3;
import '../domain/services/public_api/public_api_services.dart' as _i6;
import '../domain/usecases/public_api/get_api_usecase.dart' as _i8;
import '../presentation/cubits/app_theme/app_theme_cubit.dart' as _i4;
import '../presentation/public_api/cubits/public_api/cubit.dart' as _i9;
import '../services/dio_services.dart' as _i5;

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
    gh.lazySingleton<_i3.ApiReMapper>(() => _i3.ApiReMapper());
    gh.factory<_i4.AppThemeCubit>(() => _i4.AppThemeCubit());
    gh.lazySingleton<_i5.DioService>(() => _i5.DioService());
    gh.factory<_i6.PublicApiServices>(() => _i7.PublicApiImpl(
          gh<_i5.DioService>(),
          gh<_i3.ApiReMapper>(),
        ));
    gh.factory<_i8.GetApiUseCase>(
        () => _i8.GetApiUseCase(gh<_i6.PublicApiServices>()));
    gh.factory<_i9.PublicApiCubit>(
        () => _i9.PublicApiCubit(getApiUseCase: gh<_i8.GetApiUseCase>()));
    return this;
  }
}
