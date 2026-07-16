import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:flutter_template/core/error/response_error.dart';
import 'backend_error.dart';

class BackendErrorInterceptor extends Interceptor {
  final logger = Logger();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final data = err.response?.data;
    if (data is Map<String, dynamic>) {
      try {
        final backendError = BackendError.fromJson(data);
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            type: err.type,
            response: err.response,
            error: ResponseError.from(backendError.message),
          ),
        );
        return;
      } catch (_) {}
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        type: err.type,
        response: err.response,
        error: ResponseError.from(err),
      ),
    );
    return;
  }
}
