import 'package:flutter_test/flutter_test.dart';
import 'package:network_calling/data/repository/re_mapper/api_remapper.dart';
import 'package:network_calling/data/response_objects/public_api/public_api_response.dart';
import 'package:network_calling/domain/entities/api/api_entity.dart';

void main() {
  late ApiReMapper apiReMapper;
  late PublicApiResponse publicApiResponse;

  setUp(() {
    apiReMapper = ApiReMapper();
    publicApiResponse = const PublicApiResponse(
      count: 1,
      entries: [
        Entry(api: 'Google Books Api '),
      ],
    );
  });

  test('should be return the list of ApiEntity', () {
    final result = apiReMapper.toPublicApiList(publicApiResponse);
    expect(result, isA<List<ApiEntity>>());
  });
}
