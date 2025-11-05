import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tsl_flutter_template/domain/enum/dio_client_type.dart';

@module
abstract class NetworkModule {
  Dio _createBaseDio(String baseURL) {
    final dio = Dio()..options.baseUrl = baseURL;
    dio.options.connectTimeout = const Duration(seconds: 12);
    dio.options.receiveTimeout = const Duration(seconds: 12);
    dio.options.contentType = 'application/json';
    return dio;
  }

  @Named(DioClientType.unauthenticated)
  @singleton
  Dio get unAuthenticatedDio =>
      _createBaseDio('https://jsonplaceholder.typicode.com');

  @Named(DioClientType.authenticated)
  @singleton
  Dio get authenticatedDio =>
      _createBaseDio('https://jsonplaceholder.typicode.com');
}
