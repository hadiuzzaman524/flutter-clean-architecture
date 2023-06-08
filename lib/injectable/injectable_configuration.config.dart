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

import '../configuration/dio_services.dart' as _i3;
import '../data/data_sources/public_api/remote_data_sources.dart' as _i4;
import '../data/repository/public_api/public_api_repository_impl.dart' as _i6;
import '../domain/repository/public_api/public_api_repository.dart' as _i5;
import '../domain/usecases/public_api/get_api_usecase.dart' as _i7;
import '../presentation/public_api/cubits/public_api/cubit.dart' as _i8;

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
    gh.lazySingleton<_i3.DioService>(() => _i3.DioService());
    gh.singleton<_i4.PublicApiRemoteDataSource>(
        _i4.PublicApiRemoteDataSource());
    gh.factory<_i5.PublicApiRepository>(() => _i6.PublicApiImpl(
        publicApiRemoteDataSource: gh<_i4.PublicApiRemoteDataSource>()));
    gh.factory<_i7.GetApiUseCase>(() =>
        _i7.GetApiUseCase(publicApiRepository: gh<_i5.PublicApiRepository>()));
    gh.factory<_i8.PublicApiCubit>(
        () => _i8.PublicApiCubit(getApiUseCase: gh<_i7.GetApiUseCase>()));
    return this;
  }
}
