import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tsl_flutter_template/domain/entity/base/base_entity.dart';
import 'package:tsl_flutter_template/domain/enum/dio_client_type.dart';

part 'auth_remote_data_source.g.dart';

@RestApi()
@singleton
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(@Named(DioClientType.unauthenticated) Dio dio) =
      _AuthRemoteDataSource;

  @POST('/login')
  Future<String> login(@Body() LoginEntity inputModel);

  @POST('/signup')
  Future<String> signup(@Body() SignupEntity inputModel);
}
