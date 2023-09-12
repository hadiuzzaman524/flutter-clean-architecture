import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  Dio _createBaseDio(String baseUrl) {
    final dio = Dio()..options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);

    return dio..interceptors.add(LogInterceptor());
  }

  @singleton
  @Named('unauthenticated')
  Dio getUnAuthenticatedDio() {
    final dio = _createBaseDio('https://api.publicapis.org');
    return dio;
  }
}
