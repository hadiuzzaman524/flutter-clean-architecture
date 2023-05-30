// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublicApiEntity _$$_PublicApiEntityFromJson(Map<String, dynamic> json) =>
    _$_PublicApiEntity(
      count: json['count'] as int,
      entries: (json['entries'] as List<dynamic>)
          .map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PublicApiEntityToJson(_$_PublicApiEntity instance) =>
    <String, dynamic>{
      'count': instance.count,
      'entries': instance.entries,
    };

_$_Entry _$$_EntryFromJson(Map<String, dynamic> json) => _$_Entry(
      api: json['API'] as String,
      description: json['Description'] as String? ?? "defaultValue",
      auth: json['auth'] as String?,
      https: json['https'] as bool?,
      cors: json['cors'] as String?,
      link: json['link'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$_EntryToJson(_$_Entry instance) => <String, dynamic>{
      'API': instance.api,
      'Description': instance.description,
      'auth': instance.auth,
      'https': instance.https,
      'cors': instance.cors,
      'link': instance.link,
      'category': instance.category,
    };
