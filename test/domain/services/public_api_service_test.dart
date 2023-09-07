import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_calling/domain/entities/api/api_entity.dart';
import 'package:network_calling/domain/services/public_api/public_api_services.dart';

import 'public_api_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PublicApiServices>()])
void main() {
  late MockPublicApiServices mockPublicApiServices;
  final testApiEntityList = <ApiEntity>[];

  setUp(() {
    mockPublicApiServices = MockPublicApiServices();
  });

  test('should return the list of entity', () async {
    when(mockPublicApiServices.getAllApi())
        .thenAnswer((_) async => testApiEntityList);

    final result = await mockPublicApiServices.getAllApi();

    expect(result, testApiEntityList);
  });
}
