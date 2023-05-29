import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:network_calling/domain/entities/public_api/public_api_entity.dart';

@singleton
class PublicApiRemoteDataSource {
  Future<PublicApiEntity> getAllApi() async {
/*    const result = '''
    {
  "count": 4,
  "entries": [
    {
      "API": "AdoptAPet",
      "Description": "Resource to help get pets adopted",
      "Auth": "apiKey",
      "HTTPS": true,
      "Cors": "yes",
      "Link": "https://www.adoptapet.com/public/apis/pet_list.html",
      "Category": "Animals"
    },
    {
      "API": "Axolotl",
      "Description": "Collection of axolotl pictures and facts",
      "Auth": "",
      "HTTPS": true,
      "Cors": "no",
      "Link": "https://theaxolotlapi.netlify.app/",
      "Category": "Animals"
    },
    {
      "API": "Cat Facts",
      "Description": "Daily cat facts",
      "Auth": "",
      "HTTPS": true,
      "Cors": "no",
      "Link": "https://alexwohlbruck.github.io/cat-facts/",
      "Category": "Animals"
    },
    {
      "API": "Cataas",
      "Description": "Cat as a service (cats pictures and gifs)",
      "Auth": "",
      "HTTPS": true,
      "Cors": "no",
      "Link": "https://cataas.com/",
      "Category": "Animals"
    }
  ]
}
    ''';*/
    // ignore: inference_failure_on_instance_creation
    final http.Response result =
        await http.get(Uri.parse("https://api.publicapis.org/entries"));
    // debugPrint(result.body);
    print(result.statusCode);

    final publicApiEntity = PublicApiEntity.fromJson(
        json.decode(result.body) as Map<String, dynamic>);
    debugPrint(publicApiEntity.toString());

    return publicApiEntity;
  }
}
