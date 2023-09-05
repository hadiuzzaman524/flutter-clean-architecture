import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_calling/domain/entities/api/api_entity.dart';
import 'package:network_calling/domain/usecases/public_api/get_api_usecase.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetApiUseCase getApiUseCase;
  late MockPublicApiServices mockPublicApiServices;

  setUp(() {
    mockPublicApiServices = MockPublicApiServices();
    getApiUseCase = GetApiUseCase(mockPublicApiServices);
  });

  final testApiEntityList = <ApiEntity>[];

  test(
    'should get the list of api from this repository',
    () async {
      // arrange
      when(mockPublicApiServices.getAllApi())
          .thenAnswer((_) async => testApiEntityList);
      // act
      final result = getApiUseCase.run();
      //assert
      expect(await result, testApiEntityList);
    },
  );
}
