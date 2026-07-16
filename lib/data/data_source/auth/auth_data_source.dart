import 'package:flutter_template/data/models/request_model/base/base_request.dart';

abstract class AuthDataSource {
  Future<String> login(LoginRequestModel inputModel);
}
