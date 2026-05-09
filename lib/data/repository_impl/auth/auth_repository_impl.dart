import 'package:injectable/injectable.dart';
import 'package:tsl_flutter_template/core/helper/secure_storage_helper.dart';
import 'package:tsl_flutter_template/domain/entity/base/base_entity.dart';
import 'package:tsl_flutter_template/domain/repository/auth/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<void> login({required LoginEntity inputModel}) async {
    await Future.delayed(const Duration(seconds: 1));

    if (inputModel.pin.length < 4 || inputModel.pin.length > 6) {
      throw Exception('PIN must be 4 to 6 characters');
    }

    if (inputModel.email == 'test@gmail.com' && inputModel.pin == '1234') {
      final token = SecureStorageHelper.generateToken();

      await SecureStorageHelper.setAccessToken(token);
      return;
    }

    throw Exception('Invalid credentials');
  }

  @override
  Future<void> signup({required SignupEntity inputModel}) async {
    await Future.delayed(const Duration(seconds: 1));

    if (inputModel.name.trim().isEmpty) {
      throw Exception('Name is required');
    }

    if (inputModel.email.trim().isEmpty) {
      throw Exception('Email is required');
    }

    if (!inputModel.email.contains('@')) {
      throw Exception('Invalid email format');
    }

    if (inputModel.pin.length < 4 || inputModel.pin.length > 6) {
      throw Exception('PIN must be 4 to 6 characters');
    }
  }
}
