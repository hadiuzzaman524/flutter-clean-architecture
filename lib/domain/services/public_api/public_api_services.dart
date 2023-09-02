import 'package:network_calling/domain/entities/api/api_entity.dart';

// ignore: one_member_abstracts
abstract class PublicApiServices {
  Future<List<ApiEntity>> getAllApi();
}
