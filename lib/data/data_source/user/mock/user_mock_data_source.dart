import 'package:injectable/injectable.dart';
import 'package:tsl_flutter_template/data/data_source/user/user_data_source.dart';
import 'package:tsl_flutter_template/data/models/response_model/base/base_response.dart';

@LazySingleton()
class UserMockDataSource implements UserDataSource {
  @override
  Future<List<UserResponseModel>> getUserList() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      UserResponseModel(
        name: 'Mock User 1',
        email: 'mock1@example.com',
        address: Address(
          street: '123 Fake St',
          city: 'Mock City',
          geo: Geo(lat: '0.0', lng: '0.0'),
        ),
      ),
      UserResponseModel(
        name: 'Mock User 2',
        email: 'mock2@example.com',
        address: Address(
          street: '456 Test Ave',
          city: 'Tech Town',
          geo: Geo(lat: '1.0', lng: '1.0'),
        ),
      ),
    ];
  }

  @override
  Future<UserResponseModel> getUserById({required String userId}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return UserResponseModel(
      name: 'Mock User $userId',
      email: 'mock$userId@example.com',
      address: const Address(
        street: 'Generated St',
        city: 'Mock City',
        geo: Geo(lat: '0.0', lng: '0.0'),
      ),
    );
  }
}
