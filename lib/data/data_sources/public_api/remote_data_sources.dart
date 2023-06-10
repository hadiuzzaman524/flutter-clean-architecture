import 'package:injectable/injectable.dart';
import 'package:network_calling/domain/entities/public_api/public_api_model.dart';
import 'package:network_calling/injectable/injectable_configuration.dart';
import 'package:network_calling/services/api_services.dart';
import 'package:network_calling/services/dio_services.dart';

@singleton
class RemoteDataSources {
  RemoteDataSources() {
    final dioServices = getIt<DioService>();
    apiServices = ApiServices(dioServices.dio);
  }

  late ApiServices apiServices;

  Future<PublicApiModel> getAllApi() async {
    final response = await apiServices.getAllApi();

    return response.toPublicApiModel();
  }
}
