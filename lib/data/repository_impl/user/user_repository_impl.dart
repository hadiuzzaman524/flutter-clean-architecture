import 'package:injectable/injectable.dart';
import 'package:flutter_template/data/data_source/base/factory/data_source_factory.dart';
import 'package:flutter_template/data/data_source/user/user_data_source.dart';
import 'package:flutter_template/data/remapper/user_response_to_entity.dart';
import 'package:flutter_template/domain/entity/base/base_entity.dart';
import 'package:flutter_template/domain/repository/user/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(DataSourceFactory factory)
    : _userDataSource = factory.createUserDataSource();

  final UserDataSource _userDataSource;

  @override
  Future<List<UserEntity>> getUserList() async {
    final response = await _userDataSource.getUserList();
    return response.toUserEntities();
  }

  @override
  Future<UserEntity> getUserById({required String userId}) async {
    final response = await _userDataSource.getUserById(userId: userId);
    return response.toUserEntity();
  }
}
