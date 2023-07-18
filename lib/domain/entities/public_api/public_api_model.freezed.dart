// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PublicApiModel {
  String get apiName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PublicApiModelCopyWith<PublicApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicApiModelCopyWith<$Res> {
  factory $PublicApiModelCopyWith(
          PublicApiModel value, $Res Function(PublicApiModel) then) =
      _$PublicApiModelCopyWithImpl<$Res, PublicApiModel>;
  @useResult
  $Res call({String apiName, String description, String link});
}

/// @nodoc
class _$PublicApiModelCopyWithImpl<$Res, $Val extends PublicApiModel>
    implements $PublicApiModelCopyWith<$Res> {
  _$PublicApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiName = null,
    Object? description = null,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      apiName: null == apiName
          ? _value.apiName
          : apiName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublicApiModelCopyWith<$Res>
    implements $PublicApiModelCopyWith<$Res> {
  factory _$$_PublicApiModelCopyWith(
          _$_PublicApiModel value, $Res Function(_$_PublicApiModel) then) =
      __$$_PublicApiModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apiName, String description, String link});
}

/// @nodoc
class __$$_PublicApiModelCopyWithImpl<$Res>
    extends _$PublicApiModelCopyWithImpl<$Res, _$_PublicApiModel>
    implements _$$_PublicApiModelCopyWith<$Res> {
  __$$_PublicApiModelCopyWithImpl(
      _$_PublicApiModel _value, $Res Function(_$_PublicApiModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiName = null,
    Object? description = null,
    Object? link = null,
  }) {
    return _then(_$_PublicApiModel(
      apiName: null == apiName
          ? _value.apiName
          : apiName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PublicApiModel implements _PublicApiModel {
  _$_PublicApiModel(
      {required this.apiName, required this.description, required this.link});

  @override
  final String apiName;
  @override
  final String description;
  @override
  final String link;

  @override
  String toString() {
    return 'PublicApiModel(apiName: $apiName, description: $description, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicApiModel &&
            (identical(other.apiName, apiName) || other.apiName == apiName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.link, link) || other.link == link));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiName, description, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicApiModelCopyWith<_$_PublicApiModel> get copyWith =>
      __$$_PublicApiModelCopyWithImpl<_$_PublicApiModel>(this, _$identity);
}

abstract class _PublicApiModel implements PublicApiModel {
  factory _PublicApiModel(
      {required final String apiName,
      required final String description,
      required final String link}) = _$_PublicApiModel;

  @override
  String get apiName;
  @override
  String get description;
  @override
  String get link;
  @override
  @JsonKey(ignore: true)
  _$$_PublicApiModelCopyWith<_$_PublicApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
