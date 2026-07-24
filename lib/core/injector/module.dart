import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_template/core/env/app_environment.dart';
import 'package:flutter_template/core/env/env.dart';
import 'package:flutter_template/data/data_source/base/backend_error_interceptor.dart';
import 'package:flutter_template/domain/enum/dio_client_type.dart';
import 'package:flutter_template/domain/repository/user/user_repository.dart';

@module
abstract class NetworkModule {
  final baseURL = Env.shared.baseUrl;

  Dio _createBaseDio(String baseURL) {
    final dio = Dio()..options.baseUrl = baseURL;
    dio.options.connectTimeout = const Duration(seconds: 12);
    dio.options.receiveTimeout = const Duration(seconds: 12);
    dio.options.contentType = 'application/json';
    dio.interceptors.add(BackendErrorInterceptor());
    return dio;
  }

  @Environment(AppEnvironment.production)
  @Named(DioClientType.unauthenticated)
  @singleton
  Dio get unAuthenticatedProdDio => _createBaseDio(baseURL);

  @Environment(AppEnvironment.development)
  @Named(DioClientType.unauthenticated)
  @singleton
  Dio get unAuthenticatedDevDio => _createBaseDio(baseURL);

  @Environment(AppEnvironment.staging)
  @Named(DioClientType.unauthenticated)
  @singleton
  Dio get unAuthenticatedStgDio => _createBaseDio(baseURL);

  @Named(DioClientType.authenticated)
  @singleton
  Dio get authenticatedDio => _createBaseDio(baseURL);
}

@module
abstract class StorageModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage =>
      const FlutterSecureStorage(aOptions: AndroidOptions());

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}

@module
abstract class LoggerModule {
  @lazySingleton
  Logger get logger => Logger();
}

@module
abstract class UserRepositoryModule {
  // Development builds skip the subscription paywall, so `UserRepository`
  // resolves straight to the cached repository instead of the subscription
  // proxy (which is only registered for staging/production).
  @Environment(AppEnvironment.development)
  @lazySingleton
  UserRepository cachedUserRepository(@Named('cached') UserRepository repo) =>
      repo;
}
