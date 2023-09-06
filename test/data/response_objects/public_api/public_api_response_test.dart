import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:network_calling/data/response_objects/public_api/public_api_response.dart';

import '../../../helper/json_reader.dart';

void main() {
  late PublicApiResponse testResponseObject;
  late Map<String, dynamic> dummyJsonData;

  setUp(
    () {
      testResponseObject = const PublicApiResponse(
        count: 1,
        entries: [
          Entry(
            api: 'AdoptAPet',
            description: 'Resource to help get pets adopted',
            auth: 'apiKey',
            https: true,
            cors: 'yes',
            link: 'https://www.adoptapet.com/public/apis/pet_list.html',
            category: 'Animals',
          ),
        ],
      );
      dummyJsonData =
          json.decode(readJson('helper/dummy_data/dummy_api_response.json'))
              as Map<String, dynamic>;
    },
  );
  group('Response Object- ', () {
    test(
      'Should return valid model from json',
      () async {
        ///arrange
        ///jsonMap
        final result = PublicApiResponse.fromJson(dummyJsonData);
        expect(result, isA<PublicApiResponse>());
      },
    );

    test('Should return valid json ', () async {
      final result = publicApiResponseToJson(testResponseObject);
      final jsonObject = json.decode(result) as Map<String, dynamic>;

      expect(jsonObject, dummyJsonData);
    });
  });
}
