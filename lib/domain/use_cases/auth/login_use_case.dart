import 'package:injectable/injectable.dart';
import 'package:tsl_flutter_template/domain/entity/base/base_entity.dart';
import 'package:tsl_flutter_template/domain/repository/auth/auth_repository.dart';

@singleton
class LoginUseCase {
  LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<void> execute(LoginEntity inputModel) {
    return _authRepository.login(inputModel: inputModel);
  }
}
