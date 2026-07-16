import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tsl_flutter_template/data/data_source/user/user_data_source.dart';
import 'package:tsl_flutter_template/data/models/response_model/base/base_response.dart';
import 'package:tsl_flutter_template/domain/enum/dio_client_type.dart';

part 'user_remote_data_source.g.dart';

@RestApi()
@LazySingleton()
abstract class UserRemoteDataSource implements UserDataSource {
  @factoryMethod
  factory UserRemoteDataSource(@Named(DioClientType.unauthenticated) Dio dio) =
      _UserRemoteDataSource;

  @override
  @GET('/users')
  Future<List<UserResponseModel>> getUserList();

  @override
  @GET('/users/{id}')
  Future<UserResponseModel> getUserById({@Path('id') required String userId});
}
