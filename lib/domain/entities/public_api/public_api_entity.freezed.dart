// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_api_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicApiEntity _$PublicApiEntityFromJson(Map<String, dynamic> json) {
  return _PublicApiEntity.fromJson(json);
}

/// @nodoc
mixin _$PublicApiEntity {
  int get count => throw _privateConstructorUsedError;
  List<Entry> get entries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicApiEntityCopyWith<PublicApiEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicApiEntityCopyWith<$Res> {
  factory $PublicApiEntityCopyWith(
          PublicApiEntity value, $Res Function(PublicApiEntity) then) =
      _$PublicApiEntityCopyWithImpl<$Res, PublicApiEntity>;
  @useResult
  $Res call({int count, List<Entry> entries});
}

/// @nodoc
class _$PublicApiEntityCopyWithImpl<$Res, $Val extends PublicApiEntity>
    implements $PublicApiEntityCopyWith<$Res> {
  _$PublicApiEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? entries = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<Entry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublicApiEntityCopyWith<$Res>
    implements $PublicApiEntityCopyWith<$Res> {
  factory _$$_PublicApiEntityCopyWith(
          _$_PublicApiEntity value, $Res Function(_$_PublicApiEntity) then) =
      __$$_PublicApiEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<Entry> entries});
}

/// @nodoc
class __$$_PublicApiEntityCopyWithImpl<$Res>
    extends _$PublicApiEntityCopyWithImpl<$Res, _$_PublicApiEntity>
    implements _$$_PublicApiEntityCopyWith<$Res> {
  __$$_PublicApiEntityCopyWithImpl(
      _$_PublicApiEntity _value, $Res Function(_$_PublicApiEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? entries = null,
  }) {
    return _then(_$_PublicApiEntity(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<Entry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PublicApiEntity implements _PublicApiEntity {
  const _$_PublicApiEntity(
      {required this.count, required final List<Entry> entries})
      : _entries = entries;

  factory _$_PublicApiEntity.fromJson(Map<String, dynamic> json) =>
      _$$_PublicApiEntityFromJson(json);

  @override
  final int count;
  final List<Entry> _entries;
  @override
  List<Entry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'PublicApiEntity(count: $count, entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicApiEntity &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicApiEntityCopyWith<_$_PublicApiEntity> get copyWith =>
      __$$_PublicApiEntityCopyWithImpl<_$_PublicApiEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicApiEntityToJson(
      this,
    );
  }
}

abstract class _PublicApiEntity implements PublicApiEntity {
  const factory _PublicApiEntity(
      {required final int count,
      required final List<Entry> entries}) = _$_PublicApiEntity;

  factory _PublicApiEntity.fromJson(Map<String, dynamic> json) =
      _$_PublicApiEntity.fromJson;

  @override
  int get count;
  @override
  List<Entry> get entries;
  @override
  @JsonKey(ignore: true)
  _$$_PublicApiEntityCopyWith<_$_PublicApiEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return _Entry.fromJson(json);
}

/// @nodoc
mixin _$Entry {
  String get api => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get auth => throw _privateConstructorUsedError;
  bool get https => throw _privateConstructorUsedError;
  String get cors => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntryCopyWith<Entry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCopyWith<$Res> {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) then) =
      _$EntryCopyWithImpl<$Res, Entry>;
  @useResult
  $Res call(
      {String api,
      String description,
      String auth,
      bool https,
      String cors,
      String link,
      String category});
}

/// @nodoc
class _$EntryCopyWithImpl<$Res, $Val extends Entry>
    implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? api = null,
    Object? description = null,
    Object? auth = null,
    Object? https = null,
    Object? cors = null,
    Object? link = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      api: null == api
          ? _value.api
          : api // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      auth: null == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String,
      https: null == https
          ? _value.https
          : https // ignore: cast_nullable_to_non_nullable
              as bool,
      cors: null == cors
          ? _value.cors
          : cors // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$$_EntryCopyWith(_$_Entry value, $Res Function(_$_Entry) then) =
      __$$_EntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String api,
      String description,
      String auth,
      bool https,
      String cors,
      String link,
      String category});
}

/// @nodoc
class __$$_EntryCopyWithImpl<$Res> extends _$EntryCopyWithImpl<$Res, _$_Entry>
    implements _$$_EntryCopyWith<$Res> {
  __$$_EntryCopyWithImpl(_$_Entry _value, $Res Function(_$_Entry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? api = null,
    Object? description = null,
    Object? auth = null,
    Object? https = null,
    Object? cors = null,
    Object? link = null,
    Object? category = null,
  }) {
    return _then(_$_Entry(
      api: null == api
          ? _value.api
          : api // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      auth: null == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String,
      https: null == https
          ? _value.https
          : https // ignore: cast_nullable_to_non_nullable
              as bool,
      cors: null == cors
          ? _value.cors
          : cors // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Entry implements _Entry {
  const _$_Entry(
      {required this.api,
      required this.description,
      required this.auth,
      required this.https,
      required this.cors,
      required this.link,
      required this.category});

  factory _$_Entry.fromJson(Map<String, dynamic> json) =>
      _$$_EntryFromJson(json);

  @override
  final String api;
  @override
  final String description;
  @override
  final String auth;
  @override
  final bool https;
  @override
  final String cors;
  @override
  final String link;
  @override
  final String category;

  @override
  String toString() {
    return 'Entry(api: $api, description: $description, auth: $auth, https: $https, cors: $cors, link: $link, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Entry &&
            (identical(other.api, api) || other.api == api) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.https, https) || other.https == https) &&
            (identical(other.cors, cors) || other.cors == cors) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, api, description, auth, https, cors, link, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntryCopyWith<_$_Entry> get copyWith =>
      __$$_EntryCopyWithImpl<_$_Entry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntryToJson(
      this,
    );
  }
}

abstract class _Entry implements Entry {
  const factory _Entry(
      {required final String api,
      required final String description,
      required final String auth,
      required final bool https,
      required final String cors,
      required final String link,
      required final String category}) = _$_Entry;

  factory _Entry.fromJson(Map<String, dynamic> json) = _$_Entry.fromJson;

  @override
  String get api;
  @override
  String get description;
  @override
  String get auth;
  @override
  bool get https;
  @override
  String get cors;
  @override
  String get link;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_EntryCopyWith<_$_Entry> get copyWith =>
      throw _privateConstructorUsedError;
}
