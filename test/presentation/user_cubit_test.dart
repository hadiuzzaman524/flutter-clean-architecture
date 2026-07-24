import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_template/core/error/response_error.dart';
import 'package:flutter_template/domain/entity/base/base_entity.dart';
import 'package:flutter_template/domain/exceptions/subscription_required_exception.dart';
import 'package:flutter_template/domain/use_cases/user/get_subscription_status_use_case.dart';
import 'package:flutter_template/domain/use_cases/user/get_user_list_use_case.dart';
import 'package:flutter_template/domain/use_cases/user/set_subscription_status_use_case.dart';
import 'package:flutter_template/presentation/screen/home/cubits/user_cubit.dart';
import 'package:flutter_template/presentation/screen/home/cubits/user_state.dart';

class MockGetUserListUseCase extends Mock implements GetUserListUseCase {}

class MockGetSubscriptionStatusUseCase extends Mock
    implements GetSubscriptionStatusUseCase {}

class MockSetSubscriptionStatusUseCase extends Mock
    implements SetSubscriptionStatusUseCase {}

class MockLogger extends Mock implements Logger {}

void main() {
  late MockGetUserListUseCase useCase;
  late MockGetSubscriptionStatusUseCase getSubscriptionStatusUseCase;
  late MockSetSubscriptionStatusUseCase setSubscriptionStatusUseCase;
  late MockLogger logger;

  setUp(() {
    useCase = MockGetUserListUseCase();
    getSubscriptionStatusUseCase = MockGetSubscriptionStatusUseCase();
    setSubscriptionStatusUseCase = MockSetSubscriptionStatusUseCase();
    logger = MockLogger();

    // Default mock for constructor initialization
    when(() => getSubscriptionStatusUseCase.execute()).thenReturn(false);
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
    final cubit = UserCubit(
      useCase,
      logger,
      getSubscriptionStatusUseCase,
      setSubscriptionStatusUseCase,
    );

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
    final cubit = UserCubit(
      useCase,
      logger,
      getSubscriptionStatusUseCase,
      setSubscriptionStatusUseCase,
    );

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

  test(
    'emits isSubscriptionRequired when the proxy blocks access',
    () async {
      when(
        () => useCase.execute(),
      ).thenThrow(const SubscriptionRequiredException());
      final cubit = UserCubit(
        useCase,
        logger,
        getSubscriptionStatusUseCase,
        setSubscriptionStatusUseCase,
      );

      expectLater(
        cubit.stream,
        emitsInOrder([
          predicate<UserState>((s) => s.status.isLoading),
          predicate<UserState>(
            (s) => s.isSubscriptionRequired && !s.status.isFailure,
          ),
        ]),
      );

      await cubit.getUserList();
      await cubit.close();
    },
  );

  test(
    'subscribeAndRefresh subscribes then refetches the user list',
    () async {
      when(
        () => setSubscriptionStatusUseCase.execute(true),
      ).thenAnswer((_) async {});
      when(() => useCase.execute()).thenAnswer((_) async => users);
      final cubit = UserCubit(
        useCase,
        logger,
        getSubscriptionStatusUseCase,
        setSubscriptionStatusUseCase,
      );

      await cubit.subscribeAndRefresh();

      verify(() => setSubscriptionStatusUseCase.execute(true)).called(1);
      expect(cubit.state.isSubscribed, isTrue);
      expect(cubit.state.status.isSuccess, isTrue);
      expect(cubit.state.userList, users);

      await cubit.close();
    },
  );
}
