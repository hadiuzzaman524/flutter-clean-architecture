import 'package:dio/dio.dart';
import 'package:network_calling/data/model/public_api/public_api_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio) = _ApiServices;

  @GET('/entries')
  Future<PublicApiResponse> getAllApi();
}
