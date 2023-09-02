import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_entity.freezed.dart';

@freezed
class ApiEntity with _$ApiEntity {
  factory ApiEntity({
    required String apiName,
    required String description,
    required String link,
  }) = _ApiEntity;
}
