// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupState {

 BaseStatus get signupStatus; SignupEntity? get signupEntity;
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateCopyWith<SignupState> get copyWith => _$SignupStateCopyWithImpl<SignupState>(this as SignupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState&&(identical(other.signupStatus, signupStatus) || other.signupStatus == signupStatus)&&(identical(other.signupEntity, signupEntity) || other.signupEntity == signupEntity));
}


@override
int get hashCode => Object.hash(runtimeType,signupStatus,signupEntity);

@override
String toString() {
  return 'SignupState(signupStatus: $signupStatus, signupEntity: $signupEntity)';
}


}

/// @nodoc
abstract mixin class $SignupStateCopyWith<$Res>  {
  factory $SignupStateCopyWith(SignupState value, $Res Function(SignupState) _then) = _$SignupStateCopyWithImpl;
@useResult
$Res call({
 BaseStatus signupStatus, SignupEntity? signupEntity
});


$BaseStatusCopyWith<dynamic, $Res> get signupStatus;$SignupEntityCopyWith<$Res>? get signupEntity;

}
/// @nodoc
class _$SignupStateCopyWithImpl<$Res>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._self, this._then);

  final SignupState _self;
  final $Res Function(SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signupStatus = null,Object? signupEntity = freezed,}) {
  return _then(_self.copyWith(
signupStatus: null == signupStatus ? _self.signupStatus : signupStatus // ignore: cast_nullable_to_non_nullable
as BaseStatus,signupEntity: freezed == signupEntity ? _self.signupEntity : signupEntity // ignore: cast_nullable_to_non_nullable
as SignupEntity?,
  ));
}
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseStatusCopyWith<dynamic, $Res> get signupStatus {
  
  return $BaseStatusCopyWith<dynamic, $Res>(_self.signupStatus, (value) {
    return _then(_self.copyWith(signupStatus: value));
  });
}/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignupEntityCopyWith<$Res>? get signupEntity {
    if (_self.signupEntity == null) {
    return null;
  }

  return $SignupEntityCopyWith<$Res>(_self.signupEntity!, (value) {
    return _then(_self.copyWith(signupEntity: value));
  });
}
}


/// Adds pattern-matching-related methods to [SignupState].
extension SignupStatePatterns on SignupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupState value)  $default,){
final _that = this;
switch (_that) {
case _SignupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupState value)?  $default,){
final _that = this;
switch (_that) {
case _SignupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BaseStatus signupStatus,  SignupEntity? signupEntity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.signupStatus,_that.signupEntity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BaseStatus signupStatus,  SignupEntity? signupEntity)  $default,) {final _that = this;
switch (_that) {
case _SignupState():
return $default(_that.signupStatus,_that.signupEntity);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BaseStatus signupStatus,  SignupEntity? signupEntity)?  $default,) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.signupStatus,_that.signupEntity);case _:
  return null;

}
}

}

/// @nodoc


class _SignupState implements SignupState {
  const _SignupState({this.signupStatus = const BaseStatus.initial(), this.signupEntity});
  

@override@JsonKey() final  BaseStatus signupStatus;
@override final  SignupEntity? signupEntity;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupStateCopyWith<_SignupState> get copyWith => __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupState&&(identical(other.signupStatus, signupStatus) || other.signupStatus == signupStatus)&&(identical(other.signupEntity, signupEntity) || other.signupEntity == signupEntity));
}


@override
int get hashCode => Object.hash(runtimeType,signupStatus,signupEntity);

@override
String toString() {
  return 'SignupState(signupStatus: $signupStatus, signupEntity: $signupEntity)';
}


}

/// @nodoc
abstract mixin class _$SignupStateCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(_SignupState value, $Res Function(_SignupState) _then) = __$SignupStateCopyWithImpl;
@override @useResult
$Res call({
 BaseStatus signupStatus, SignupEntity? signupEntity
});


@override $BaseStatusCopyWith<dynamic, $Res> get signupStatus;@override $SignupEntityCopyWith<$Res>? get signupEntity;

}
/// @nodoc
class __$SignupStateCopyWithImpl<$Res>
    implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(this._self, this._then);

  final _SignupState _self;
  final $Res Function(_SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signupStatus = null,Object? signupEntity = freezed,}) {
  return _then(_SignupState(
signupStatus: null == signupStatus ? _self.signupStatus : signupStatus // ignore: cast_nullable_to_non_nullable
as BaseStatus,signupEntity: freezed == signupEntity ? _self.signupEntity : signupEntity // ignore: cast_nullable_to_non_nullable
as SignupEntity?,
  ));
}

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseStatusCopyWith<dynamic, $Res> get signupStatus {
  
  return $BaseStatusCopyWith<dynamic, $Res>(_self.signupStatus, (value) {
    return _then(_self.copyWith(signupStatus: value));
  });
}/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignupEntityCopyWith<$Res>? get signupEntity {
    if (_self.signupEntity == null) {
    return null;
  }

  return $SignupEntityCopyWith<$Res>(_self.signupEntity!, (value) {
    return _then(_self.copyWith(signupEntity: value));
  });
}
}

// dart format on
