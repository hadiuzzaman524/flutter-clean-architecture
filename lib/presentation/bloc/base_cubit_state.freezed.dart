// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseCubitState<Params,Data> {

 UseCasePhase get phase; bool get paramsValid; Params get params; Data get data; FailureModel get failure;
/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseCubitStateCopyWith<Params, Data, BaseCubitState<Params, Data>> get copyWith => _$BaseCubitStateCopyWithImpl<Params, Data, BaseCubitState<Params, Data>>(this as BaseCubitState<Params, Data>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseCubitState<Params, Data>&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.paramsValid, paramsValid) || other.paramsValid == paramsValid)&&const DeepCollectionEquality().equals(other.params, params)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,phase,paramsValid,const DeepCollectionEquality().hash(params),const DeepCollectionEquality().hash(data),failure);

@override
String toString() {
  return 'BaseCubitState<$Params, $Data>(phase: $phase, paramsValid: $paramsValid, params: $params, data: $data, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $BaseCubitStateCopyWith<Params,Data,$Res>  {
  factory $BaseCubitStateCopyWith(BaseCubitState<Params, Data> value, $Res Function(BaseCubitState<Params, Data>) _then) = _$BaseCubitStateCopyWithImpl;
@useResult
$Res call({
 UseCasePhase phase, bool paramsValid, Params params, Data data, FailureModel failure
});




}
/// @nodoc
class _$BaseCubitStateCopyWithImpl<Params,Data,$Res>
    implements $BaseCubitStateCopyWith<Params, Data, $Res> {
  _$BaseCubitStateCopyWithImpl(this._self, this._then);

  final BaseCubitState<Params, Data> _self;
  final $Res Function(BaseCubitState<Params, Data>) _then;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phase = null,Object? paramsValid = null,Object? params = freezed,Object? data = freezed,Object? failure = null,}) {
  return _then(_self.copyWith(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as UseCasePhase,paramsValid: null == paramsValid ? _self.paramsValid : paramsValid // ignore: cast_nullable_to_non_nullable
as bool,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Params,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as FailureModel,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseCubitState].
extension BaseCubitStatePatterns<Params,Data> on BaseCubitState<Params, Data> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseCubitState<Params, Data> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseCubitState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseCubitState<Params, Data> value)  $default,){
final _that = this;
switch (_that) {
case _BaseCubitState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseCubitState<Params, Data> value)?  $default,){
final _that = this;
switch (_that) {
case _BaseCubitState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UseCasePhase phase,  bool paramsValid,  Params params,  Data data,  FailureModel failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseCubitState() when $default != null:
return $default(_that.phase,_that.paramsValid,_that.params,_that.data,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UseCasePhase phase,  bool paramsValid,  Params params,  Data data,  FailureModel failure)  $default,) {final _that = this;
switch (_that) {
case _BaseCubitState():
return $default(_that.phase,_that.paramsValid,_that.params,_that.data,_that.failure);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UseCasePhase phase,  bool paramsValid,  Params params,  Data data,  FailureModel failure)?  $default,) {final _that = this;
switch (_that) {
case _BaseCubitState() when $default != null:
return $default(_that.phase,_that.paramsValid,_that.params,_that.data,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _BaseCubitState<Params,Data> implements BaseCubitState<Params, Data> {
  const _BaseCubitState({required this.phase, required this.paramsValid, required this.params, required this.data, required this.failure});
  

@override final  UseCasePhase phase;
@override final  bool paramsValid;
@override final  Params params;
@override final  Data data;
@override final  FailureModel failure;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseCubitStateCopyWith<Params, Data, _BaseCubitState<Params, Data>> get copyWith => __$BaseCubitStateCopyWithImpl<Params, Data, _BaseCubitState<Params, Data>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseCubitState<Params, Data>&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.paramsValid, paramsValid) || other.paramsValid == paramsValid)&&const DeepCollectionEquality().equals(other.params, params)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,phase,paramsValid,const DeepCollectionEquality().hash(params),const DeepCollectionEquality().hash(data),failure);

@override
String toString() {
  return 'BaseCubitState<$Params, $Data>(phase: $phase, paramsValid: $paramsValid, params: $params, data: $data, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$BaseCubitStateCopyWith<Params,Data,$Res> implements $BaseCubitStateCopyWith<Params, Data, $Res> {
  factory _$BaseCubitStateCopyWith(_BaseCubitState<Params, Data> value, $Res Function(_BaseCubitState<Params, Data>) _then) = __$BaseCubitStateCopyWithImpl;
@override @useResult
$Res call({
 UseCasePhase phase, bool paramsValid, Params params, Data data, FailureModel failure
});




}
/// @nodoc
class __$BaseCubitStateCopyWithImpl<Params,Data,$Res>
    implements _$BaseCubitStateCopyWith<Params, Data, $Res> {
  __$BaseCubitStateCopyWithImpl(this._self, this._then);

  final _BaseCubitState<Params, Data> _self;
  final $Res Function(_BaseCubitState<Params, Data>) _then;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? paramsValid = null,Object? params = freezed,Object? data = freezed,Object? failure = null,}) {
  return _then(_BaseCubitState<Params, Data>(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as UseCasePhase,paramsValid: null == paramsValid ? _self.paramsValid : paramsValid // ignore: cast_nullable_to_non_nullable
as bool,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Params,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as FailureModel,
  ));
}


}

// dart format on
