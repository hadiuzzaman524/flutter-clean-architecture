import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_template/core/helper/secure_storage_service.dart';
import 'package:flutter_template/data/data_source/auth/auth_data_source.dart';
import 'package:flutter_template/data/data_source/base/factory/data_source_factory.dart';
import 'package:flutter_template/data/models/request_model/base/base_request.dart';
import 'package:flutter_template/data/repository_impl/auth/auth_repository_impl.dart';
import 'package:flutter_template/domain/entity/base/base_entity.dart';

class MockDataSourceFactory extends Mock implements DataSourceFactory {}

class MockAuthDataSource extends Mock implements AuthDataSource {}

class MockSecureStorageService extends Mock implements SecureStorageService {}

void main() {
  setUpAll(() {
    registerFallbackValue(const LoginRequestModel(email: '', pin: ''));
  });

  late MockDataSourceFactory factory;
  late MockAuthDataSource dataSource;
  late MockSecureStorageService secureStorage;
  late AuthRepositoryImpl repository;

  setUp(() {
    factory = MockDataSourceFactory();
    dataSource = MockAuthDataSource();
    secureStorage = MockSecureStorageService();
    when(() => factory.createAuthDataSource()).thenReturn(dataSource);
    repository = AuthRepositoryImpl(factory, secureStorage);
  });

  test('login persists the token returned by the data source', () async {
    when(() => dataSource.login(any())).thenAnswer((_) async => 'token123');
    when(() => secureStorage.setAccessToken(any())).thenAnswer((_) async {});

    await repository.login(
      inputModel: const LoginEntity(email: 'a@a.com', pin: '123456'),
    );

    verify(() => secureStorage.setAccessToken('token123')).called(1);
  });

  test('login maps the entity to a request model for the data source',
      () async {
    when(() => dataSource.login(any())).thenAnswer((_) async => 'token');
    when(() => secureStorage.setAccessToken(any())).thenAnswer((_) async {});

    await repository.login(
      inputModel: const LoginEntity(email: 'user@x.com', pin: '999999'),
    );

    final captured = verify(() => dataSource.login(captureAny())).captured;
    final sent = captured.single as LoginRequestModel;
    expect(sent.email, 'user@x.com');
    expect(sent.pin, '999999');
  });
}
