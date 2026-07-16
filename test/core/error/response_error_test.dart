import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_template/core/error/response_error.dart'
    show ResponseError;

void main() {
  test('returns the same instance when given a ResponseError', () {
    const error = ResponseError.notFound();
    expect(ResponseError.from(error), error);
  });

  test('unwraps a ResponseError already attached to DioException.error', () {
    final dioError = DioException(
      requestOptions: RequestOptions(path: '/'),
      error: const ResponseError.unAuthorized(),
    );
    expect(ResponseError.from(dioError), const ResponseError.unAuthorized());
  });

  test('maps a known status code to the matching error', () {
    final dioError = DioException(
      requestOptions: RequestOptions(path: '/'),
      type: DioExceptionType.badResponse,
      response: Response(
        requestOptions: RequestOptions(path: '/'),
        statusCode: 404,
      ),
    );
    expect(ResponseError.from(dioError), const ResponseError.notFound());
  });

  test('maps an unknown status code to unExcepted instead of throwing', () {
    final dioError = DioException(
      requestOptions: RequestOptions(path: '/'),
      type: DioExceptionType.badResponse,
      response: Response(
        requestOptions: RequestOptions(path: '/'),
        statusCode: 418,
      ),
    );
    expect(ResponseError.from(dioError), const ResponseError.unExcepted());
  });

  test('wraps a plain string into errorWithMessage', () {
    expect(
      ResponseError.from('boom'),
      const ResponseError.errorWithMessage('boom'),
    );
  });
}
