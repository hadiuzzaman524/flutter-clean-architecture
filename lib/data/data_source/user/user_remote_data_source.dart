import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tsl_flutter_template/data/response_model/base/base_response.dart';
import 'package:tsl_flutter_template/domain/enum/dio_client_type.dart';

part 'user_remote_data_source.g.dart';

@RestApi()
@singleton
abstract class UserRemoteDataSource {
  @factoryMethod
  factory UserRemoteDataSource(
    @Named(DioClientType.unauthenticated) Dio dio,
  ) = _UserRemoteDataSource;

  @GET('/users')
  Future<List<UserResponseModel>> getUserList();
}
