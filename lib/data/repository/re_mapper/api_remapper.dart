import 'package:injectable/injectable.dart';
import 'package:network_calling/data/response_objects/public_api/public_api_response.dart';
import 'package:network_calling/domain/entities/api/api_entity.dart';

@lazySingleton
class ApiReMapper {
  List<ApiEntity> toPublicApiList(PublicApiResponse publicApiResponse) {
    final apiList = <ApiEntity>[];

    for (final element in publicApiResponse.entries) {
      apiList.add(
        ApiEntity(
          apiName: element.api,
          description: element.description,
          link: element.link,
        ),
      );
    }
    return apiList;
  }
}
