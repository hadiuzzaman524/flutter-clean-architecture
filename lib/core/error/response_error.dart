import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_error.freezed.dart';

@freezed
sealed class ResponseError with _$ResponseError implements Exception {
  const ResponseError._();

  const factory ResponseError.badResponse() = BadResponse;

  const factory ResponseError.notFound() = NotFound;

  const factory ResponseError.unAuthorized() = UnAuthorized;

  const factory ResponseError.noInternetConnection() = NoInternetConnection;

  const factory ResponseError.unExcepted() = UnExpected;

  const factory ResponseError.response() = Response;

  const factory ResponseError.sendTimeOut() = SendTimeOut;

  const factory ResponseError.connectionTimeOut() = ConnectionTimeOut;

  const factory ResponseError.receiveTimeOut() = ReceiveTimeOut;

  const factory ResponseError.cancel() = Cancel;

  const factory ResponseError.unknown() = Unknown;

  const factory ResponseError.conflict() = Conflict;

  const factory ResponseError.unProcessable() = UnProcessable;

  const factory ResponseError.tooManyRequest() = TooManyRequest;

  const factory ResponseError.internalServerError() = InternalServerError;

  const factory ResponseError.badGetWay() = BadGetWay;

  const factory ResponseError.errorWithMessage(String errorMessage) =
      ErrorWithMessage;

  // ignore: prefer_constructors_over_static_methods
  static ResponseError from(Object object) {
    try {
      if (object is ResponseError) {
        return object;
      }

      if (object is DioException) {
        // The interceptor may have already mapped the failure into a
        // ResponseError and attached it to `error`; prefer that.
        if (object.error is ResponseError) {
          return object.error! as ResponseError;
        }
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
          default:
            return _parseResponseError(object);
        }
      } else if (object is String) {
        return ResponseError.errorWithMessage(object);
      }

      return const ResponseError.unExcepted();
    } catch (e) {
      return const ResponseError.unExcepted();
    }
  }

  static ResponseError _parseResponseError(DioException exception) {
    switch (exception.response?.statusCode) {
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
        return const ResponseError.unExcepted();
    }
  }

  bool get isNoInternet => this is NoInternetConnection;

  bool get isResponse => this is Response;
}
