// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseStatus<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseStatus<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseStatus<$T>()';
}


}

/// @nodoc
class $BaseStatusCopyWith<T,$Res>  {
$BaseStatusCopyWith(BaseStatus<T> _, $Res Function(BaseStatus<T>) __);
}


/// Adds pattern-matching-related methods to [BaseStatus].
extension BaseStatusPatterns<T> on BaseStatus<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial<T> value)?  initial,TResult Function( Loading<T> value)?  loading,TResult Function( Success<T> value)?  success,TResult Function( Valid<T> value)?  valid,TResult Function( Invalid<T> value)?  invalid,TResult Function( ButtonClicked<T> value)?  buttonClicked,TResult Function( Failure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Valid() when valid != null:
return valid(_that);case Invalid() when invalid != null:
return invalid(_that);case ButtonClicked() when buttonClicked != null:
return buttonClicked(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial<T> value)  initial,required TResult Function( Loading<T> value)  loading,required TResult Function( Success<T> value)  success,required TResult Function( Valid<T> value)  valid,required TResult Function( Invalid<T> value)  invalid,required TResult Function( ButtonClicked<T> value)  buttonClicked,required TResult Function( Failure<T> value)  failure,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Valid():
return valid(_that);case Invalid():
return invalid(_that);case ButtonClicked():
return buttonClicked(_that);case Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial<T> value)?  initial,TResult? Function( Loading<T> value)?  loading,TResult? Function( Success<T> value)?  success,TResult? Function( Valid<T> value)?  valid,TResult? Function( Invalid<T> value)?  invalid,TResult? Function( ButtonClicked<T> value)?  buttonClicked,TResult? Function( Failure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Valid() when valid != null:
return valid(_that);case Invalid() when invalid != null:
return invalid(_that);case ButtonClicked() when buttonClicked != null:
return buttonClicked(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function()?  valid,TResult Function()?  invalid,TResult Function()?  buttonClicked,TResult Function( ResponseError responseError)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success();case Valid() when valid != null:
return valid();case Invalid() when invalid != null:
return invalid();case ButtonClicked() when buttonClicked != null:
return buttonClicked();case Failure() when failure != null:
return failure(_that.responseError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function()  valid,required TResult Function()  invalid,required TResult Function()  buttonClicked,required TResult Function( ResponseError responseError)  failure,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Success():
return success();case Valid():
return valid();case Invalid():
return invalid();case ButtonClicked():
return buttonClicked();case Failure():
return failure(_that.responseError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function()?  valid,TResult? Function()?  invalid,TResult? Function()?  buttonClicked,TResult? Function( ResponseError responseError)?  failure,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success();case Valid() when valid != null:
return valid();case Invalid() when invalid != null:
return invalid();case ButtonClicked() when buttonClicked != null:
return buttonClicked();case Failure() when failure != null:
return failure(_that.responseError);case _:
  return null;

}
}

}

/// @nodoc


class Initial<T> extends BaseStatus<T> {
  const Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseStatus<$T>.initial()';
}


}




/// @nodoc


class Loading<T> extends BaseStatus<T> {
  const Loading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseStatus<$T>.loading()';
}


}




/// @nodoc


class Success<T> extends BaseStatus<T> {
  const Success(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseStatus<$T>.success()';
}


}




/// @nodoc


class Valid<T> extends BaseStatus<T> {
  const Valid(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Valid<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseStatus<$T>.valid()';
}


}




/// @nodoc


class Invalid<T> extends BaseStatus<T> {
  const Invalid(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Invalid<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseStatus<$T>.invalid()';
}


}




/// @nodoc


class ButtonClicked<T> extends BaseStatus<T> {
  const ButtonClicked(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ButtonClicked<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseStatus<$T>.buttonClicked()';
}


}




/// @nodoc


class Failure<T> extends BaseStatus<T> {
  const Failure(this.responseError): super._();
  

 final  ResponseError responseError;

/// Create a copy of BaseStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<T, Failure<T>> get copyWith => _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure<T>&&(identical(other.responseError, responseError) || other.responseError == responseError));
}


@override
int get hashCode => Object.hash(runtimeType,responseError);

@override
String toString() {
  return 'BaseStatus<$T>.failure(responseError: $responseError)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<T,$Res> implements $BaseStatusCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 ResponseError responseError
});


$ResponseErrorCopyWith<$Res> get responseError;

}
/// @nodoc
class _$FailureCopyWithImpl<T,$Res>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<T> _self;
  final $Res Function(Failure<T>) _then;

/// Create a copy of BaseStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? responseError = null,}) {
  return _then(Failure<T>(
null == responseError ? _self.responseError : responseError // ignore: cast_nullable_to_non_nullable
as ResponseError,
  ));
}

/// Create a copy of BaseStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseErrorCopyWith<$Res> get responseError {
  
  return $ResponseErrorCopyWith<$Res>(_self.responseError, (value) {
    return _then(_self.copyWith(responseError: value));
  });
}
}

// dart format on
