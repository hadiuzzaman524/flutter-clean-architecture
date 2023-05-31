import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:network_calling/data/model/public_api/public_api_response.dart';
import 'package:network_calling/domain/entities/public_api/public_api_model.dart';

@singleton
class PublicApiRemoteDataSource {
  Future<PublicApiModel> getAllApi() async {
    // ignore: inference_failure_on_instance_creation
    final http.Response result =
        await http.get(Uri.parse("https://api.publicapis.org/entries"));
    debugPrint(result.body);
    print(result.statusCode);

    final publicApiResponse = PublicApiResponse.fromJson(
        json.decode(result.body) as Map<String, dynamic>);

    return publicApiResponse.toPublicApiModel();
  }
}
