import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_template/domain/entity/base/base_entity.dart';
import 'package:flutter_template/domain/repository/auth/auth_repository.dart';
import 'package:flutter_template/domain/use_cases/auth/login_use_case.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(const LoginEntity(email: '', pin: ''));
  });

  late MockAuthRepository repository;
  late LoginUseCase useCase;

  setUp(() {
    repository = MockAuthRepository();
    useCase = LoginUseCase(repository);
  });

  test('execute forwards the entity to repository.login', () async {
    const entity = LoginEntity(email: 'a@a.com', pin: '123456');
    when(
      () => repository.login(inputModel: any(named: 'inputModel')),
    ).thenAnswer((_) async {});

    await useCase.execute(entity);

    verify(() => repository.login(inputModel: entity)).called(1);
  });
}
