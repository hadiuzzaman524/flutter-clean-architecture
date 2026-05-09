part of '../base/base_entity.dart';

@freezed
abstract class SignupEntity with _$SignupEntity {
  const factory SignupEntity({
    required String email,
    required String name,
    required String pin,
  }) = _SignupEntity;
}
