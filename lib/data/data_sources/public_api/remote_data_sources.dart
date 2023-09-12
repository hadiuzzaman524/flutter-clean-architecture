import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_calling/data/response_objects/public_api/public_api_response.dart';
import 'package:retrofit/http.dart';

part 'remote_data_sources.g.dart';

@RestApi()
@lazySingleton
abstract class RemoteDataSources {
  @factoryMethod
  factory RemoteDataSources(@Named('unauthenticated') Dio dio) =
      _RemoteDataSources;

  @GET('/entries')
  Future<PublicApiResponse> getAllApi();
}
