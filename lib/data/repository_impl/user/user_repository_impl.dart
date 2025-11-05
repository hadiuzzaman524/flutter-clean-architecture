import 'package:injectable/injectable.dart';
import 'package:tsl_flutter_template/data/data_source/user/user_remote_data_source.dart';
import 'package:tsl_flutter_template/data/remapper/user_response_to_entity.dart';
import 'package:tsl_flutter_template/domain/entity/base/base_entity.dart';
import 'package:tsl_flutter_template/domain/repository/user/user_repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._remoteDataSource);

  final UserRemoteDataSource _remoteDataSource;

  @override
  Future<List<UserEntity>> getUserList() async {
    final userList = await _remoteDataSource.getUserList();
    return userList.toUserEntities();
  }

  @override
  Future<UserEntity> getUserById({required String userId}) async {
    throw UnimplementedError('Not Implemented');
  }
}
