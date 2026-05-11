part of '../base/base_entity.dart';

@freezed
abstract class LoginEntity with _$LoginEntity {
  const factory LoginEntity({required String email, required String pin}) =
      _LoginEntity;
}
