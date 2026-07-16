import 'package:flutter_template/domain/entity/base/base_entity.dart';

abstract class AuthRepository {
  Future<void> login({required LoginEntity inputModel});
}
