import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioService {
  DioService() {
    /// add basic configuration for dio instance
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.publicapis.org',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  /// create dio instance for global use
  late Dio _dio;

  /// getter for access _dio object
  Dio get dio => _dio;
}
