// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginationState<T,P> {

 PaginationList<T> get pagination; P get params; BaseStatus get status;
/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationStateCopyWith<T, P, PaginationState<T, P>> get copyWith => _$PaginationStateCopyWithImpl<T, P, PaginationState<T, P>>(this as PaginationState<T, P>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationState<T, P>&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.params, params)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(params),status);

@override
String toString() {
  return 'PaginationState<$T, $P>(pagination: $pagination, params: $params, status: $status)';
}


}

/// @nodoc
abstract mixin class $PaginationStateCopyWith<T,P,$Res>  {
  factory $PaginationStateCopyWith(PaginationState<T, P> value, $Res Function(PaginationState<T, P>) _then) = _$PaginationStateCopyWithImpl;
@useResult
$Res call({
 PaginationList<T> pagination, P params, BaseStatus status
});


$BaseStatusCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class _$PaginationStateCopyWithImpl<T,P,$Res>
    implements $PaginationStateCopyWith<T, P, $Res> {
  _$PaginationStateCopyWithImpl(this._self, this._then);

  final PaginationState<T, P> _self;
  final $Res Function(PaginationState<T, P>) _then;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pagination = null,Object? params = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationList<T>,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as P,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseStatus,
  ));
}
/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseStatusCopyWith<dynamic, $Res> get status {
  
  return $BaseStatusCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaginationState].
extension PaginationStatePatterns<T,P> on PaginationState<T, P> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationState<T, P> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationState<T, P> value)  $default,){
final _that = this;
switch (_that) {
case _PaginationState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationState<T, P> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaginationList<T> pagination,  P params,  BaseStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationState() when $default != null:
return $default(_that.pagination,_that.params,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaginationList<T> pagination,  P params,  BaseStatus status)  $default,) {final _that = this;
switch (_that) {
case _PaginationState():
return $default(_that.pagination,_that.params,_that.status);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaginationList<T> pagination,  P params,  BaseStatus status)?  $default,) {final _that = this;
switch (_that) {
case _PaginationState() when $default != null:
return $default(_that.pagination,_that.params,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _PaginationState<T,P> implements PaginationState<T, P> {
  const _PaginationState({required this.pagination, required this.params, this.status = const BaseStatus.initial()});
  

@override final  PaginationList<T> pagination;
@override final  P params;
@override@JsonKey() final  BaseStatus status;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationStateCopyWith<T, P, _PaginationState<T, P>> get copyWith => __$PaginationStateCopyWithImpl<T, P, _PaginationState<T, P>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationState<T, P>&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.params, params)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(params),status);

@override
String toString() {
  return 'PaginationState<$T, $P>(pagination: $pagination, params: $params, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PaginationStateCopyWith<T,P,$Res> implements $PaginationStateCopyWith<T, P, $Res> {
  factory _$PaginationStateCopyWith(_PaginationState<T, P> value, $Res Function(_PaginationState<T, P>) _then) = __$PaginationStateCopyWithImpl;
@override @useResult
$Res call({
 PaginationList<T> pagination, P params, BaseStatus status
});


@override $BaseStatusCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class __$PaginationStateCopyWithImpl<T,P,$Res>
    implements _$PaginationStateCopyWith<T, P, $Res> {
  __$PaginationStateCopyWithImpl(this._self, this._then);

  final _PaginationState<T, P> _self;
  final $Res Function(_PaginationState<T, P>) _then;

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pagination = null,Object? params = freezed,Object? status = null,}) {
  return _then(_PaginationState<T, P>(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationList<T>,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as P,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseStatus,
  ));
}

/// Create a copy of PaginationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseStatusCopyWith<dynamic, $Res> get status {
  
  return $BaseStatusCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
