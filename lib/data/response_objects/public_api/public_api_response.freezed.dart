// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicApiResponse _$PublicApiResponseFromJson(Map<String, dynamic> json) {
  return _PublicApiEntity.fromJson(json);
}

/// @nodoc
mixin _$PublicApiResponse {
  int get count => throw _privateConstructorUsedError;
  List<Entry> get entries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicApiResponseCopyWith<PublicApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicApiResponseCopyWith<$Res> {
  factory $PublicApiResponseCopyWith(
          PublicApiResponse value, $Res Function(PublicApiResponse) then) =
      _$PublicApiResponseCopyWithImpl<$Res, PublicApiResponse>;
  @useResult
  $Res call({int count, List<Entry> entries});
}

/// @nodoc
class _$PublicApiResponseCopyWithImpl<$Res, $Val extends PublicApiResponse>
    implements $PublicApiResponseCopyWith<$Res> {
  _$PublicApiResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$PublicApiEntityImplCopyWith<$Res>
    implements $PublicApiResponseCopyWith<$Res> {
  factory _$$PublicApiEntityImplCopyWith(_$PublicApiEntityImpl value,
          $Res Function(_$PublicApiEntityImpl) then) =
      __$$PublicApiEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<Entry> entries});
}

/// @nodoc
class __$$PublicApiEntityImplCopyWithImpl<$Res>
    extends _$PublicApiResponseCopyWithImpl<$Res, _$PublicApiEntityImpl>
    implements _$$PublicApiEntityImplCopyWith<$Res> {
  __$$PublicApiEntityImplCopyWithImpl(
      _$PublicApiEntityImpl _value, $Res Function(_$PublicApiEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? entries = null,
  }) {
    return _then(_$PublicApiEntityImpl(
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
class _$PublicApiEntityImpl extends _PublicApiEntity {
  const _$PublicApiEntityImpl(
      {required this.count, required final List<Entry> entries})
      : _entries = entries,
        super._();

  factory _$PublicApiEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicApiEntityImplFromJson(json);

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
    return 'PublicApiResponse(count: $count, entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicApiEntityImpl &&
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
  _$$PublicApiEntityImplCopyWith<_$PublicApiEntityImpl> get copyWith =>
      __$$PublicApiEntityImplCopyWithImpl<_$PublicApiEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicApiEntityImplToJson(
      this,
    );
  }
}

abstract class _PublicApiEntity extends PublicApiResponse {
  const factory _PublicApiEntity(
      {required final int count,
      required final List<Entry> entries}) = _$PublicApiEntityImpl;
  const _PublicApiEntity._() : super._();

  factory _PublicApiEntity.fromJson(Map<String, dynamic> json) =
      _$PublicApiEntityImpl.fromJson;

  @override
  int get count;
  @override
  List<Entry> get entries;
  @override
  @JsonKey(ignore: true)
  _$$PublicApiEntityImplCopyWith<_$PublicApiEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return _Entry.fromJson(json);
}

/// @nodoc
mixin _$Entry {
// ignore: invalid_annotation_target
  @JsonKey(name: 'API')
  String get api => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Auth')
  String? get auth => throw _privateConstructorUsedError;
  @JsonKey(name: 'HTTPS')
  bool? get https => throw _privateConstructorUsedError;
  @JsonKey(name: 'Cors')
  String? get cors =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'Link')
  String get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'Category')
  String? get category => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'API') String api,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'Auth') String? auth,
      @JsonKey(name: 'HTTPS') bool? https,
      @JsonKey(name: 'Cors') String? cors,
      @JsonKey(name: 'Link') String link,
      @JsonKey(name: 'Category') String? category});
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
    Object? auth = freezed,
    Object? https = freezed,
    Object? cors = freezed,
    Object? link = null,
    Object? category = freezed,
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
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      https: freezed == https
          ? _value.https
          : https // ignore: cast_nullable_to_non_nullable
              as bool?,
      cors: freezed == cors
          ? _value.cors
          : cors // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntryImplCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$$EntryImplCopyWith(
          _$EntryImpl value, $Res Function(_$EntryImpl) then) =
      __$$EntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'API') String api,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'Auth') String? auth,
      @JsonKey(name: 'HTTPS') bool? https,
      @JsonKey(name: 'Cors') String? cors,
      @JsonKey(name: 'Link') String link,
      @JsonKey(name: 'Category') String? category});
}

/// @nodoc
class __$$EntryImplCopyWithImpl<$Res>
    extends _$EntryCopyWithImpl<$Res, _$EntryImpl>
    implements _$$EntryImplCopyWith<$Res> {
  __$$EntryImplCopyWithImpl(
      _$EntryImpl _value, $Res Function(_$EntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? api = null,
    Object? description = null,
    Object? auth = freezed,
    Object? https = freezed,
    Object? cors = freezed,
    Object? link = null,
    Object? category = freezed,
  }) {
    return _then(_$EntryImpl(
      api: null == api
          ? _value.api
          : api // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      auth: freezed == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as String?,
      https: freezed == https
          ? _value.https
          : https // ignore: cast_nullable_to_non_nullable
              as bool?,
      cors: freezed == cors
          ? _value.cors
          : cors // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntryImpl implements _Entry {
  const _$EntryImpl(
      {@JsonKey(name: 'API') required this.api,
      @JsonKey(name: 'Description') this.description = 'Empty',
      @JsonKey(name: 'Auth') this.auth,
      @JsonKey(name: 'HTTPS') this.https,
      @JsonKey(name: 'Cors') this.cors,
      @JsonKey(name: 'Link') this.link = 'Empty',
      @JsonKey(name: 'Category') this.category});

  factory _$EntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntryImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'API')
  final String api;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'Auth')
  final String? auth;
  @override
  @JsonKey(name: 'HTTPS')
  final bool? https;
  @override
  @JsonKey(name: 'Cors')
  final String? cors;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'Link')
  final String link;
  @override
  @JsonKey(name: 'Category')
  final String? category;

  @override
  String toString() {
    return 'Entry(api: $api, description: $description, auth: $auth, https: $https, cors: $cors, link: $link, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntryImpl &&
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
  _$$EntryImplCopyWith<_$EntryImpl> get copyWith =>
      __$$EntryImplCopyWithImpl<_$EntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntryImplToJson(
      this,
    );
  }
}

abstract class _Entry implements Entry {
  const factory _Entry(
      {@JsonKey(name: 'API') required final String api,
      @JsonKey(name: 'Description') final String description,
      @JsonKey(name: 'Auth') final String? auth,
      @JsonKey(name: 'HTTPS') final bool? https,
      @JsonKey(name: 'Cors') final String? cors,
      @JsonKey(name: 'Link') final String link,
      @JsonKey(name: 'Category') final String? category}) = _$EntryImpl;

  factory _Entry.fromJson(Map<String, dynamic> json) = _$EntryImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'API')
  String get api;
  @override
  @JsonKey(name: 'Description')
  String get description;
  @override
  @JsonKey(name: 'Auth')
  String? get auth;
  @override
  @JsonKey(name: 'HTTPS')
  bool? get https;
  @override
  @JsonKey(name: 'Cors')
  String? get cors;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'Link')
  String get link;
  @override
  @JsonKey(name: 'Category')
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$EntryImplCopyWith<_$EntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
