import 'dart:io';

import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_error.freezed.dart';

@freezed
class ResponseError with _$ResponseError implements Exception {
  const ResponseError._();

  const factory ResponseError.badResponse() = _BadResponse;

  const factory ResponseError.notFound() = _NotFound;

  const factory ResponseError.unAuthorized() = _UnAuthorized;

  const factory ResponseError.noInternetConnection() = NoInternetConnection;

  const factory ResponseError.unExcepted() = _UnExpected;

  const factory ResponseError.response() = _Response;

  const factory ResponseError.sendTimeOut() = _SendTimeOut;

  const factory ResponseError.connectionTimeOut() = _ConnectionTimeOut;

  const factory ResponseError.receiveTimeOut() = _ReceiveTimeOut;

  const factory ResponseError.cancel() = _Cancel;

  const factory ResponseError.unknown() = _Unknown;

  const factory ResponseError.conflict() = _Conflict;

  const factory ResponseError.unProcessable() = _UnProcessable;

  const factory ResponseError.tooManyRequest() = _TooManyRequest;

  const factory ResponseError.internalServerError() = _InternalServerError;

  const factory ResponseError.badGetWay() = _BadGetWay;

  const factory ResponseError.errorWithMessage(String errorMessage) =
      _ErrorWithMessage;

  // ignore: prefer_constructors_over_static_methods
  static ResponseError from(Object object) {
    try {
      if (object is ResponseError) {
        return object;
      }

      if (object is DioException) {
        if (object.error is SocketException) {
          return const ResponseError.noInternetConnection();
        }
        switch (object.type) {
          case DioExceptionType.sendTimeout:
            return const ResponseError.sendTimeOut();
          case DioExceptionType.connectionTimeout:
            return const ResponseError.connectionTimeOut();
          case DioExceptionType.receiveTimeout:
            return const ResponseError.receiveTimeOut();
          case DioExceptionType.cancel:
            return const ResponseError.cancel();
          case DioExceptionType.unknown:
            return const ResponseError.unknown();

          // ignore: no_default_cases
          default:
            return _parseResponseError(object);
        }
      }
      return const ResponseError.unExcepted();
    } catch (e) {
      return const ResponseError.unExcepted();
    }
  }

  static ResponseError _parseResponseError(DioException exception) {
    switch (exception.response!.statusCode) {
      case 400:
        return const ResponseError.badResponse();
      case 401:
        return const ResponseError.unAuthorized();
      case 404:
        return const ResponseError.notFound();
      case 409:
        return const ResponseError.conflict();
      case 422:
        return const ResponseError.unProcessable();
      case 429:
        return const ResponseError.tooManyRequest();
      case 500:
        return const ResponseError.internalServerError();
      case 502:
        return const ResponseError.badGetWay();
      default:
        throw Exception(
          'Unknown Status Code: ${exception.response!.statusCode}',
        );
    }
  }

  bool get isNoInternet => this is NoInternetConnection;
  bool get isResponse => this is _Response;
}
