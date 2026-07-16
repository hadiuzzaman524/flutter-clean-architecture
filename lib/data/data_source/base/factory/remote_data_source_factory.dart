import 'package:flutter_template/data/data_source/auth/auth_data_source.dart';
import 'package:flutter_template/data/data_source/auth/remote/auth_remote_data_source.dart';
import 'package:flutter_template/data/data_source/base/factory/data_source_factory.dart';
import 'package:flutter_template/data/data_source/user/remote/user_remote_data_source.dart';
import 'package:flutter_template/data/data_source/user/user_data_source.dart';

class RemoteDataSourceFactory implements DataSourceFactory {
  RemoteDataSourceFactory(this._userRemote, this._authRemote);

  final UserRemoteDataSource _userRemote;
  final AuthRemoteDataSource _authRemote;

  @override
  UserDataSource createUserDataSource() => _userRemote;

  @override
  AuthDataSource createAuthDataSource() => _authRemote;
}
