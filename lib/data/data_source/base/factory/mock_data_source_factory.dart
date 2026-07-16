import 'package:flutter_template/data/data_source/auth/auth_data_source.dart';
import 'package:flutter_template/data/data_source/auth/mock/auth_mock_data_source.dart';
import 'package:flutter_template/data/data_source/base/factory/data_source_factory.dart';
import 'package:flutter_template/data/data_source/user/mock/user_mock_data_source.dart';
import 'package:flutter_template/data/data_source/user/user_data_source.dart';

class MockDataSourceFactory implements DataSourceFactory {
  MockDataSourceFactory(this._userMock, this._authMock);

  final UserMockDataSource _userMock;
  final AuthMockDataSource _authMock;

  @override
  UserDataSource createUserDataSource() => _userMock;

  @override
  AuthDataSource createAuthDataSource() => _authMock;
}
