import 'package:network_calling/domain/entities/public_api/public_api_entity.dart';

// ignore: one_member_abstracts,
abstract class PublicApiRepository {
  Future<PublicApiEntity> getAllApi();
}
