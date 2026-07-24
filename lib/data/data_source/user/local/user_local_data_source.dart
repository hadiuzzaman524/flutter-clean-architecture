import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_template/data/models/response_model/base/base_response.dart';
import 'package:flutter_template/data/remapper/user_response_to_entity.dart';
import 'package:flutter_template/domain/entity/base/base_entity.dart';

abstract class UserLocalDataSource {
  Future<List<UserEntity>> getUserList();
  Future<UserEntity?> getUserById({required String userId});
  Future<void> saveUserList(List<UserEntity> userList);
  Future<void> saveUser(UserEntity user);
}

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  UserLocalDataSourceImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;
  static const String _userListKey = 'user_list_key';

  @override
  Future<List<UserEntity>> getUserList() async {
    final jsonString = _sharedPreferences.getString(_userListKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) => UserResponseModel.fromJson(json as Map<String, dynamic>).toUserEntity())
          .toList();
    }
    return [];
  }

  @override
  Future<UserEntity?> getUserById({required String userId}) async {
    final users = await getUserList();
    for (final user in users) {
      if (user.name == userId) {
        return user;
      }
    }
    return null;
  }

  @override
  Future<void> saveUserList(List<UserEntity> userList) async {
    final jsonString = json.encode(
      userList.map((e) => {
        'name': e.name,
        'email': e.email,
        'address': {
          'street': e.address,
          'city': e.city,
          'geo': {
            'lat': e.latitude.toString(),
            'lng': e.longitude.toString(),
          }
        }
      }).toList(),
    );
    await _sharedPreferences.setString(_userListKey, jsonString);
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    final users = await getUserList();
    final index = users.indexWhere((element) => element.name == user.name);
    if (index != -1) {
      users[index] = user;
    } else {
      users.add(user);
    }
    await saveUserList(users);
  }
}
