import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:network_calling/configuration/dio_services.dart';
import 'package:network_calling/data/model/public_api/public_api_response.dart';
import 'package:network_calling/domain/entities/public_api/public_api_model.dart';
import 'package:network_calling/injectable/injectable_configuration.dart';

@singleton
class PublicApiRemoteDataSource {
  Future<PublicApiModel> getAllApi() async {
    final dioServices = getIt<DioService>();

    final response = await dioServices.dio.get('/entries');
    debugPrint(response.statusCode.toString());

    final publicApiResponse =
        PublicApiResponse.fromJson(response.data as Map<String, dynamic>);

    return publicApiResponse.toPublicApiModel();
  }
}
