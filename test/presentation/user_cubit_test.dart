import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_template/core/error/response_error.dart';
import 'package:flutter_template/domain/entity/base/base_entity.dart';
import 'package:flutter_template/domain/use_cases/user/get_user_list_use_case.dart';
import 'package:flutter_template/presentation/screen/home/cubits/user_cubit.dart';
import 'package:flutter_template/presentation/screen/home/cubits/user_state.dart';

class MockGetUserListUseCase extends Mock implements GetUserListUseCase {}

class MockLogger extends Mock implements Logger {}

void main() {
  late MockGetUserListUseCase useCase;
  late MockLogger logger;

  setUp(() {
    useCase = MockGetUserListUseCase();
    logger = MockLogger();
  });

  const users = [
    UserEntity(
      name: 'Alice',
      email: 'alice@example.com',
      address: 'Street',
      city: 'City',
      latitude: 1,
      longitude: 2,
    ),
  ];

  test('emits loading then success with the fetched users', () async {
    when(() => useCase.execute()).thenAnswer((_) async => users);
    final cubit = UserCubit(useCase, logger);

    expectLater(
      cubit.stream,
      emitsInOrder([
        predicate<UserState>((s) => s.status.isLoading),
        predicate<UserState>(
          (s) => s.status.isSuccess && s.userList.length == 1,
        ),
      ]),
    );

    await cubit.getUserList();
    await cubit.close();
  });

  test('emits loading then failure when the use case throws', () async {
    when(() => useCase.execute()).thenThrow(const ResponseError.notFound());
    final cubit = UserCubit(useCase, logger);

    expectLater(
      cubit.stream,
      emitsInOrder([
        predicate<UserState>((s) => s.status.isLoading),
        predicate<UserState>((s) => s.status.isFailure),
      ]),
    );

    await cubit.getUserList();
    await cubit.close();
  });
}
