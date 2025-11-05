import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tsl_flutter_template/domain/enum/dio_client_type.dart';

@module
abstract class EnvModule {
  @Named(DioClientType.unauthenticated)
  @singleton
  Dio get unAuthenticatedDio =>
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @Named(DioClientType.authenticated)
  @singleton
  Dio get authenticatedDio =>
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
}
