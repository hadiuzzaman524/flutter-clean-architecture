import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network_calling/data/model/public_api/public_api_response.dart';

part 'public_api_model.freezed.dart';

@freezed
class PublicApiModel with _$PublicApiModel {
  factory PublicApiModel({
    required List<Entry> apiList,
  }) = _PublicApiModel;
}
