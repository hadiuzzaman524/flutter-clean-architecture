import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_template/data/data_source/base/factory/data_source_factory.dart';
import 'package:flutter_template/data/data_source/user/user_data_source.dart';
import 'package:flutter_template/data/models/response_model/base/base_response.dart';
import 'package:flutter_template/data/repository_impl/user/user_repository_impl.dart';

class MockDataSourceFactory extends Mock implements DataSourceFactory {}

class MockUserDataSource extends Mock implements UserDataSource {}

void main() {
  late MockDataSourceFactory factory;
  late MockUserDataSource dataSource;
  late UserRepositoryImpl repository;

  setUp(() {
    factory = MockDataSourceFactory();
    dataSource = MockUserDataSource();
    when(() => factory.createUserDataSource()).thenReturn(dataSource);
    repository = UserRepositoryImpl(factory);
  });

  test('getUserList maps response models to domain entities', () async {
    const response = [
      UserResponseModel(
        name: 'John',
        email: 'john@example.com',
        address: Address(
          street: '1st Street',
          city: 'New York',
          geo: Geo(lat: '1.5', lng: '2.5'),
        ),
      ),
    ];
    when(() => dataSource.getUserList()).thenAnswer((_) async => response);

    final result = await repository.getUserList();

    expect(result, hasLength(1));
    final user = result.first;
    expect(user.name, 'John');
    expect(user.email, 'john@example.com');
    expect(user.address, '1st Street');
    expect(user.city, 'New York');
    expect(user.latitude, 1.5);
    expect(user.longitude, 2.5);
  });

  test('getUserById maps a single response model to an entity', () async {
    const response = UserResponseModel(
      name: 'Jane',
      email: 'jane@example.com',
      address: Address(street: '2nd Ave', city: 'LA'),
    );
    when(
      () => dataSource.getUserById(userId: any(named: 'userId')),
    ).thenAnswer((_) async => response);

    final user = await repository.getUserById(userId: '10');

    expect(user.name, 'Jane');
    expect(user.city, 'LA');
    // Missing geo defaults to 0 in the remapper.
    expect(user.latitude, 0);
    expect(user.longitude, 0);
  });
}
