import 'package:flutter_template/data/models/response_model/base/base_response.dart';
import 'package:flutter_template/domain/entity/base/base_entity.dart';

extension UserResponseMapper on List<UserResponseModel> {
  /// Maps a list of UserResponseModel to a list of UserEntity
  List<UserEntity> toUserEntities() {
    return map((userResponse) => userResponse.toUserEntity()).toList();
  }
}

extension UserResponseItemMapper on UserResponseModel {
  /// Maps a UserResponseModel to a UserEntity
  UserEntity toUserEntity() {
    return UserEntity(
      name: name ?? '',
      email: email ?? '',
      address: address?.street ?? '',
      city: address?.city ?? '',
      latitude: double.parse(address?.geo?.lat ?? '0'),
      longitude: double.parse(address?.geo?.lng ?? '0'),
    );
  }
}
