import 'package:injectable/injectable.dart';
import 'package:network_calling/data/api/api_services.dart';
import 'package:network_calling/domain/entities/public_api/public_api_model.dart';
import 'package:network_calling/injectable/injectable_configuration.dart';
import 'package:network_calling/services/dio_services.dart';

@singleton
class RemoteDataSources {
  RemoteDataSources() {
    final dioServices = getIt<DioService>();
    apiServices = ApiServices(dioServices.dio);
  }

  late ApiServices apiServices;

  Future<List<PublicApiModel>> getAllApi() async {
    try {
      final response = await apiServices.getAllApi();
      return response.entries.map(response.toPublicApiModel).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
