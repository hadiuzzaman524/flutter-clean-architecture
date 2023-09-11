import 'package:flutter/cupertino.dart';
import 'package:network_calling/domain/common/response_error.dart';

class ErrorLocalization {
  const ErrorLocalization._(this.context);

  final BuildContext context;

  String responseError(ResponseError responseError) {
    return responseError.when(
      badResponse: () => 'Bad Request',
      notFound: () => 'Not Found',
      unAuthorized: () => 'Wrong user name or password',
      noInternetConnection: () => 'No Internet Connection',
      unExcepted: () => 'Unexpected',
      response: () => '',
      sendTimeOut: () => 'Send time out, please try again',
      connectionTimeOut: () => 'Connection timeout',
      receiveTimeOut: () => 'Received timeout',
      cancel: () => 'Cancel request',
      unknown: () => 'Unknown error',
      errorWithMessage: (String message) => message,
      conflict: () => 'Already used this email',
      unProcessable: () => 'Un processable request',
      tooManyRequest: () => 'Too many request',
      internalServerError: () => 'Internal Server Error',
      badGetWay: () => 'Bad gateway',
    );
  }
}

extension ErrorLocalizationContext on BuildContext {
  ErrorLocalization get errorLocalization => ErrorLocalization._(this);
}
