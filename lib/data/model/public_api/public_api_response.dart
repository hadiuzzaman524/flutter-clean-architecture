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
    @JsonKey(name: "API") required String api,
    @JsonKey(name: "Description") @Default("defaultValue") String description,
    String? auth,
    bool? https,
    String? cors,
    @JsonKey(name: "Link") @Default("Empty") String link,
    String? category,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
/*
class PublicApiEntity {
  int? count;
  List<Entries>? entries;

  PublicApiEntity({this.count, this.entries});

  PublicApiEntity.fromJson(Map<String, dynamic> json) {
    count = json['count'] as int;
    if (json['entries'] != null) {
      entries = <Entries>[];
      json['entries'].forEach((v) {
        entries!.add(new Entries.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.entries != null) {
      data['entries'] = this.entries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entries {
  String? aPI;
  String? description;
  String? auth;
  bool? hTTPS;
  String? cors;
  String? link;
  String? category;

  Entries(
      {this.aPI,
      this.description,
      this.auth,
      this.hTTPS,
      this.cors,
      this.link,
      this.category});

  Entries.fromJson(Map<String, dynamic> json) {
    aPI = json['API'] as String;
    description = json['Description'] as String;
    auth = json['Auth'] as String;
    hTTPS = json['HTTPS'] as bool;
    cors = json['Cors'] as String;
    link = json['Link'] as String;
    category = json['Category'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['API'] = this.aPI;
    data['Description'] = this.description;
    data['Auth'] = this.auth;
    data['HTTPS'] = this.hTTPS;
    data['Cors'] = this.cors;
    data['Link'] = this.link;
    data['Category'] = this.category;
    return data;
  }
}

 */
