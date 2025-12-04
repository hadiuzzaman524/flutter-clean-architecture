// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceStatusState {

 bool get mobileNetwork; bool get wifiNetwork; bool get hasInternet;
/// Create a copy of DeviceStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceStatusStateCopyWith<DeviceStatusState> get copyWith => _$DeviceStatusStateCopyWithImpl<DeviceStatusState>(this as DeviceStatusState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceStatusState&&(identical(other.mobileNetwork, mobileNetwork) || other.mobileNetwork == mobileNetwork)&&(identical(other.wifiNetwork, wifiNetwork) || other.wifiNetwork == wifiNetwork)&&(identical(other.hasInternet, hasInternet) || other.hasInternet == hasInternet));
}


@override
int get hashCode => Object.hash(runtimeType,mobileNetwork,wifiNetwork,hasInternet);

@override
String toString() {
  return 'DeviceStatusState(mobileNetwork: $mobileNetwork, wifiNetwork: $wifiNetwork, hasInternet: $hasInternet)';
}


}

/// @nodoc
abstract mixin class $DeviceStatusStateCopyWith<$Res>  {
  factory $DeviceStatusStateCopyWith(DeviceStatusState value, $Res Function(DeviceStatusState) _then) = _$DeviceStatusStateCopyWithImpl;
@useResult
$Res call({
 bool mobileNetwork, bool wifiNetwork, bool hasInternet
});




}
/// @nodoc
class _$DeviceStatusStateCopyWithImpl<$Res>
    implements $DeviceStatusStateCopyWith<$Res> {
  _$DeviceStatusStateCopyWithImpl(this._self, this._then);

  final DeviceStatusState _self;
  final $Res Function(DeviceStatusState) _then;

/// Create a copy of DeviceStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mobileNetwork = null,Object? wifiNetwork = null,Object? hasInternet = null,}) {
  return _then(_self.copyWith(
mobileNetwork: null == mobileNetwork ? _self.mobileNetwork : mobileNetwork // ignore: cast_nullable_to_non_nullable
as bool,wifiNetwork: null == wifiNetwork ? _self.wifiNetwork : wifiNetwork // ignore: cast_nullable_to_non_nullable
as bool,hasInternet: null == hasInternet ? _self.hasInternet : hasInternet // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceStatusState].
extension DeviceStatusStatePatterns on DeviceStatusState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceStatusState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceStatusState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceStatusState value)  $default,){
final _that = this;
switch (_that) {
case _DeviceStatusState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceStatusState value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceStatusState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool mobileNetwork,  bool wifiNetwork,  bool hasInternet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceStatusState() when $default != null:
return $default(_that.mobileNetwork,_that.wifiNetwork,_that.hasInternet);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool mobileNetwork,  bool wifiNetwork,  bool hasInternet)  $default,) {final _that = this;
switch (_that) {
case _DeviceStatusState():
return $default(_that.mobileNetwork,_that.wifiNetwork,_that.hasInternet);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool mobileNetwork,  bool wifiNetwork,  bool hasInternet)?  $default,) {final _that = this;
switch (_that) {
case _DeviceStatusState() when $default != null:
return $default(_that.mobileNetwork,_that.wifiNetwork,_that.hasInternet);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceStatusState implements DeviceStatusState {
  const _DeviceStatusState({required this.mobileNetwork, required this.wifiNetwork, required this.hasInternet});
  

@override final  bool mobileNetwork;
@override final  bool wifiNetwork;
@override final  bool hasInternet;

/// Create a copy of DeviceStatusState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceStatusStateCopyWith<_DeviceStatusState> get copyWith => __$DeviceStatusStateCopyWithImpl<_DeviceStatusState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceStatusState&&(identical(other.mobileNetwork, mobileNetwork) || other.mobileNetwork == mobileNetwork)&&(identical(other.wifiNetwork, wifiNetwork) || other.wifiNetwork == wifiNetwork)&&(identical(other.hasInternet, hasInternet) || other.hasInternet == hasInternet));
}


@override
int get hashCode => Object.hash(runtimeType,mobileNetwork,wifiNetwork,hasInternet);

@override
String toString() {
  return 'DeviceStatusState(mobileNetwork: $mobileNetwork, wifiNetwork: $wifiNetwork, hasInternet: $hasInternet)';
}


}

/// @nodoc
abstract mixin class _$DeviceStatusStateCopyWith<$Res> implements $DeviceStatusStateCopyWith<$Res> {
  factory _$DeviceStatusStateCopyWith(_DeviceStatusState value, $Res Function(_DeviceStatusState) _then) = __$DeviceStatusStateCopyWithImpl;
@override @useResult
$Res call({
 bool mobileNetwork, bool wifiNetwork, bool hasInternet
});




}
/// @nodoc
class __$DeviceStatusStateCopyWithImpl<$Res>
    implements _$DeviceStatusStateCopyWith<$Res> {
  __$DeviceStatusStateCopyWithImpl(this._self, this._then);

  final _DeviceStatusState _self;
  final $Res Function(_DeviceStatusState) _then;

/// Create a copy of DeviceStatusState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mobileNetwork = null,Object? wifiNetwork = null,Object? hasInternet = null,}) {
  return _then(_DeviceStatusState(
mobileNetwork: null == mobileNetwork ? _self.mobileNetwork : mobileNetwork // ignore: cast_nullable_to_non_nullable
as bool,wifiNetwork: null == wifiNetwork ? _self.wifiNetwork : wifiNetwork // ignore: cast_nullable_to_non_nullable
as bool,hasInternet: null == hasInternet ? _self.hasInternet : hasInternet // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
