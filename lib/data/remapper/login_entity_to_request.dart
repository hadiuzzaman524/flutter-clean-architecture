import 'package:flutter_template/data/models/request_model/base/base_request.dart';
import 'package:flutter_template/domain/entity/base/base_entity.dart';

extension LoginEntityMapper on LoginEntity {
  /// Maps a LoginEntity to a LoginRequestModel
  LoginRequestModel toRequestModel() {
    return LoginRequestModel(email: email, pin: pin);
  }
}
