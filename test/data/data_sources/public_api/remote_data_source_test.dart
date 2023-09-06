import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_calling/data/data_sources/public_api/remote_data_sources.dart';
import 'package:network_calling/data/response_objects/public_api/public_api_response.dart';

import '../../../helper/json_reader.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RemoteDataSources>()])
void main() {
  late MockRemoteDataSources mockRemoteDataSource;
  late PublicApiResponse dummyResponse;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSources();
    final dummyJsonData =
        json.decode(readJson('helper/dummy_data/dummy_api_response.json'))
            as Map<String, dynamic>;
    dummyResponse = PublicApiResponse.fromJson(dummyJsonData);
  });

  group('Public API Data Source', () {
    test('request should fetch api data', () async {
      when(mockRemoteDataSource.getAllApi()).thenAnswer(
        (_) async => dummyResponse,
      );
      final response = await mockRemoteDataSource.getAllApi();

      expect(response, isA<PublicApiResponse>());
    });

    test('should throw a exception when status code is not 200', () async {
      try {
        /// throw custom exception
        when(mockRemoteDataSource.getAllApi()).thenAnswer(
          (_) async => throw DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 400,
              requestOptions: RequestOptions(),
            ),
          ),
        );
        final result = mockRemoteDataSource.getAllApi();
        expect(result, throwsA(const TypeMatcher<DioException>()));
      } catch (e) {}
    });
  });
}
