import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsl_flutter_template/core/error/response_error.dart';

part 'base_status.freezed.dart';

@freezed
abstract class BaseStatus<T> with _$BaseStatus<T> {
  const BaseStatus._();

  const factory BaseStatus.initial() = Initial<T>;

  const factory BaseStatus.loading() = Loading<T>;

  const factory BaseStatus.success() = Success<T>;

  const factory BaseStatus.valid() = Valid<T>;

  const factory BaseStatus.invalid() = Invalid<T>;

  const factory BaseStatus.buttonClicked() = ButtonClicked<T>;

  const factory BaseStatus.failure(ResponseError responseError) = Failure<T>;

  bool get initial => this is Initial<T>;

  bool get isLoading => this is Loading<T>;

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is Failure<T>;

  bool get isValid => this is Valid<T>;

  bool get isInvalid => this is Invalid<T>;

  bool get isButtonClicked => this is ButtonClicked<T>;
}
