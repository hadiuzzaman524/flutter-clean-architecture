part of '../base/base_entity.dart';

@freezed
abstract class LoginEntity with _$LoginEntity {
  const factory LoginEntity({required String email, required String pin}) =
      _LoginEntity;

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);
}
