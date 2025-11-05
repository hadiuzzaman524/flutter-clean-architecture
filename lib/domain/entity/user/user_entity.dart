part of '../base/base_entity.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String name,
    required String email,
    required String address,
    required String city,
    required double latitude,
    required double longitude,
  }) = _UserEntity;
}
