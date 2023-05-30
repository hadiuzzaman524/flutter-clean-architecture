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
  List<Entry> get apiList => throw _privateConstructorUsedError;

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
  $Res call({List<Entry> apiList});
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
    Object? apiList = null,
  }) {
    return _then(_value.copyWith(
      apiList: null == apiList
          ? _value.apiList
          : apiList // ignore: cast_nullable_to_non_nullable
              as List<Entry>,
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
  $Res call({List<Entry> apiList});
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
    Object? apiList = null,
  }) {
    return _then(_$_PublicApiModel(
      apiList: null == apiList
          ? _value._apiList
          : apiList // ignore: cast_nullable_to_non_nullable
              as List<Entry>,
    ));
  }
}

/// @nodoc

class _$_PublicApiModel implements _PublicApiModel {
  _$_PublicApiModel({required final List<Entry> apiList}) : _apiList = apiList;

  final List<Entry> _apiList;
  @override
  List<Entry> get apiList {
    if (_apiList is EqualUnmodifiableListView) return _apiList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apiList);
  }

  @override
  String toString() {
    return 'PublicApiModel(apiList: $apiList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicApiModel &&
            const DeepCollectionEquality().equals(other._apiList, _apiList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_apiList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicApiModelCopyWith<_$_PublicApiModel> get copyWith =>
      __$$_PublicApiModelCopyWithImpl<_$_PublicApiModel>(this, _$identity);
}

abstract class _PublicApiModel implements PublicApiModel {
  factory _PublicApiModel({required final List<Entry> apiList}) =
      _$_PublicApiModel;

  @override
  List<Entry> get apiList;
  @override
  @JsonKey(ignore: true)
  _$$_PublicApiModelCopyWith<_$_PublicApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
