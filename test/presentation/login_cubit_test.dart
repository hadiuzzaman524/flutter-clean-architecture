import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_template/core/error/response_error.dart';
import 'package:flutter_template/domain/entity/base/base_entity.dart';
import 'package:flutter_template/domain/use_cases/auth/login_use_case.dart';
import 'package:flutter_template/presentation/screen/auth/login/cubit/login_cubit.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockLogger extends Mock implements Logger {}

void main() {
  setUpAll(() {
    registerFallbackValue(const LoginEntity(email: '', pin: ''));
  });

  late MockLoginUseCase useCase;
  late MockLogger logger;

  setUp(() {
    useCase = MockLoginUseCase();
    logger = MockLogger();
  });

  const input = LoginEntity(email: 'a@a.com', pin: '123456');

  test('emits loading then success and keeps the submitted entity', () async {
    when(() => useCase.execute(any())).thenAnswer((_) async {});
    final cubit = LoginCubit(useCase, logger);

    expectLater(
      cubit.stream,
      emitsInOrder([
        predicate<LoginState>((s) => s.loginStatus.isLoading),
        predicate<LoginState>(
          (s) => s.loginStatus.isSuccess && s.loginEntity == input,
        ),
      ]),
    );

    await cubit.login(input);
    await cubit.close();
  });

  test('emits loading then failure when the use case throws', () async {
    when(() => useCase.execute(any())).thenThrow(const ResponseError.unknown());
    final cubit = LoginCubit(useCase, logger);

    expectLater(
      cubit.stream,
      emitsInOrder([
        predicate<LoginState>((s) => s.loginStatus.isLoading),
        predicate<LoginState>((s) => s.loginStatus.isFailure),
      ]),
    );

    await cubit.login(input);
    await cubit.close();
  });
}
