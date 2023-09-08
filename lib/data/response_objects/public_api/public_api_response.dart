// To parse this JSON data, do
//
//     final publicApiEntity = publicApiEntityFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

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
}

@freezed
class Entry with _$Entry {
  const factory Entry({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'API') required String api,
    @JsonKey(name: 'Description') @Default('Empty') String description,
    @JsonKey(name: 'Auth') String? auth,
    @JsonKey(name: 'HTTPS') bool? https,
    @JsonKey(name: 'Cors') String? cors,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'Link') @Default('Empty') String link,
    @JsonKey(name: 'Category') String? category,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
