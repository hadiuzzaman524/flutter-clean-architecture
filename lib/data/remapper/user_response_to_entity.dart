import 'package:tsl_flutter_template/data/response_model/base/base_response.dart';
import 'package:tsl_flutter_template/domain/entity/base/base_entity.dart';

extension UserResponseMapper on List<UserResponseModel> {
  /// Maps a list of UserResponseModel to a list of UserEntity
  List<UserEntity> toUserEntities() {
    return map(
      (userResponse) => UserEntity(
        name: userResponse.name ?? '',
        email: userResponse.email ?? '',
        address: userResponse.address?.street ?? '',
        city: userResponse.address?.city ?? '',
        latitude: double.parse(userResponse.address?.geo?.lat ?? '0'),
        longitude: double.parse(userResponse.address?.geo?.lng ?? '0'),
      ),
    ).toList();
  }
}
