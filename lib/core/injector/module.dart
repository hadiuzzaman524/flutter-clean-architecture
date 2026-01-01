import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tsl_flutter_template/core/env/env.dart';
import 'package:tsl_flutter_template/domain/enum/dio_client_type.dart';

@module
abstract class NetworkModule {
  final baseURL = Env.shared.baseUrl;

  Dio _createBaseDio(String baseURL) {
    final dio = Dio()..options.baseUrl = baseURL;
    dio.options.connectTimeout = const Duration(seconds: 12);
    dio.options.receiveTimeout = const Duration(seconds: 12);
    dio.options.contentType = 'application/json';
    return dio;
  }

  @Environment("production")
  @Named(DioClientType.unauthenticated)
  @singleton
  Dio get unAuthenticatedProdDio => _createBaseDio(baseURL);

  @Environment("development")
  @Named(DioClientType.unauthenticated)
  @singleton
  Dio get unAuthenticatedDevDio => _createBaseDio(baseURL);

  @Environment("staging")
  @Named(DioClientType.unauthenticated)
  @singleton
  Dio get unAuthenticatedStgDio => _createBaseDio(baseURL);

  @Named(DioClientType.authenticated)
  @singleton
  Dio get authenticatedDio => _createBaseDio(baseURL);
}
