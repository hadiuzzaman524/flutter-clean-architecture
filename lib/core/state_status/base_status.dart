import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_template/core/error/response_error.dart';

part 'base_status.freezed.dart';

@freezed
sealed class BaseStatus with _$BaseStatus {
  const BaseStatus._();

  const factory BaseStatus.initial() = Initial;

  const factory BaseStatus.loading() = Loading;

  const factory BaseStatus.success() = Success;

  const factory BaseStatus.valid() = Valid;

  const factory BaseStatus.invalid() = Invalid;

  const factory BaseStatus.buttonClicked() = ButtonClicked;

  const factory BaseStatus.failure(ResponseError responseError) = Failure;

  bool get initial => this is Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isFailure => this is Failure;

  bool get isValid => this is Valid;

  bool get isInvalid => this is Invalid;

  bool get isButtonClicked => this is ButtonClicked;
}
