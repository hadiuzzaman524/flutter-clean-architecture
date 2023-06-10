import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  String? authToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (authToken != null) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }
    return super.onRequest(options, handler);
  }
}
