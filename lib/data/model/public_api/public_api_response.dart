// To parse this JSON data, do
//
//     final publicApiEntity = publicApiEntityFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network_calling/domain/entities/public_api/public_api_model.dart';

part 'public_api_response.freezed.dart';
part 'public_api_response.g.dart';

PublicApiResponse publicApiResponseFromJson(String str) =>
    PublicApiResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String publicApiResponseToJson(PublicApiResponse data) =>
    json.encode(data.toJson());

@freezed
class PublicApiResponse with _$PublicApiResponse {
  const factory PublicApiResponse({
    required int count,
    required List<Entry> entries,
  }) = _PublicApiEntity;

  const PublicApiResponse._();

  factory PublicApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PublicApiResponseFromJson(json);

  PublicApiModel toPublicApiModel() {
    return PublicApiModel(apiList: entries);
  }
}

@freezed
class Entry with _$Entry {
  const factory Entry({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'API') required String api,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'Description') @Default('Empty') String description,
    String? auth,
    bool? https,
    String? cors,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'Link') @Default('Empty') String link,
    String? category,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
