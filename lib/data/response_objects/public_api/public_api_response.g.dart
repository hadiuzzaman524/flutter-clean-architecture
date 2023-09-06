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
      description: json['Description'] as String? ?? 'Empty',
      auth: json['Auth'] as String?,
      https: json['HTTPS'] as bool?,
      cors: json['Cors'] as String?,
      link: json['Link'] as String? ?? 'Empty',
      category: json['Category'] as String?,
    );

Map<String, dynamic> _$$_EntryToJson(_$_Entry instance) => <String, dynamic>{
      'API': instance.api,
      'Description': instance.description,
      'Auth': instance.auth,
      'HTTPS': instance.https,
      'Cors': instance.cors,
      'Link': instance.link,
      'Category': instance.category,
    };
