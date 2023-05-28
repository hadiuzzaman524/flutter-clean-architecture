// To parse this JSON data, do
//
//     final publicApiEntity = publicApiEntityFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_api_entity.freezed.dart';
part 'public_api_entity.g.dart';

PublicApiEntity publicApiEntityFromJson(String str) {
  // print(json.decode(str) as Map<String, dynamic>);
  return PublicApiEntity.fromJson(json.decode(str) as Map<String, dynamic>);
}

String publicApiEntityToJson(PublicApiEntity data) =>
    json.encode(data.toJson());

@freezed
class PublicApiEntity with _$PublicApiEntity {
  const factory PublicApiEntity({
    required int count,
    required List<Entry> entries,
  }) = _PublicApiEntity;

  factory PublicApiEntity.fromJson(Map<String, dynamic> json) =>
      _$PublicApiEntityFromJson(json);
}

@freezed
class Entry with _$Entry {
  const factory Entry({
    required String? api,
    required String? description,
    required String? auth,
    required bool? https,
    required String? cors,
    required String? link,
    required String? category,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
