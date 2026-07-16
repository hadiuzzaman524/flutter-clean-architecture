import 'package:flutter_template/data/data_source/auth/auth_data_source.dart';
import 'package:flutter_template/data/data_source/user/user_data_source.dart';

/// The Abstract Factory interface.
/// It declares a set of methods for creating individual data sources.
abstract class DataSourceFactory {
  UserDataSource createUserDataSource();
  AuthDataSource createAuthDataSource();
}
