import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_api_model.freezed.dart';

@freezed
class PublicApiModel with _$PublicApiModel {
  factory PublicApiModel({
    required String apiName,
    required String description,
    required String link,
  }) = _PublicApiModel;
}
