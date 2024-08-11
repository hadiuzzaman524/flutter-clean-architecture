// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicApiEntityImpl _$$PublicApiEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PublicApiEntityImpl(
      count: (json['count'] as num).toInt(),
      entries: (json['entries'] as List<dynamic>)
          .map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PublicApiEntityImplToJson(
        _$PublicApiEntityImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'entries': instance.entries,
    };

_$EntryImpl _$$EntryImplFromJson(Map<String, dynamic> json) => _$EntryImpl(
      api: json['API'] as String,
      description: json['Description'] as String? ?? 'Empty',
      auth: json['Auth'] as String?,
      https: json['HTTPS'] as bool?,
      cors: json['Cors'] as String?,
      link: json['Link'] as String? ?? 'Empty',
      category: json['Category'] as String?,
    );

Map<String, dynamic> _$$EntryImplToJson(_$EntryImpl instance) =>
    <String, dynamic>{
      'API': instance.api,
      'Description': instance.description,
      'Auth': instance.auth,
      'HTTPS': instance.https,
      'Cors': instance.cors,
      'Link': instance.link,
      'Category': instance.category,
    };
