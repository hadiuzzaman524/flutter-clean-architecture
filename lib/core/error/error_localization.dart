import 'package:flutter/widgets.dart';
import 'package:flutter_template/core/error/response_error.dart';
import 'package:flutter_template/l10n/l10n.dart';

class ErrorLocalization {
  const ErrorLocalization._(this.context);

  final BuildContext context;

  String responseError(ResponseError responseError) {
    final l10n = context.l10n;

    return switch (responseError) {
      BadResponse() => l10n.errorBadRequest,
      NotFound() => l10n.errorNotFound,
      UnAuthorized() => l10n.errorUnauthorized,
      NoInternetConnection() => l10n.errorNoInternet,
      UnExpected() => l10n.errorUnexpected,
      Response() => '',
      SendTimeOut() => l10n.errorSendTimeout,
      ConnectionTimeOut() => l10n.errorConnectionTimeout,
      ReceiveTimeOut() => l10n.errorReceiveTimeout,
      Cancel() => l10n.errorCancel,
      Unknown() => l10n.errorUnknown,
      Conflict() => l10n.errorConflict,
      UnProcessable() => l10n.errorUnprocessable,
      TooManyRequest() => l10n.errorTooManyRequests,
      InternalServerError() => l10n.errorInternalServerError,
      BadGetWay() => l10n.errorBadGateway,
      ErrorWithMessage(errorMessage: final message) => message,
    };
  }
}

extension ErrorLocalizationContext on BuildContext {
  ErrorLocalization get errorLocalization => ErrorLocalization._(this);
}
