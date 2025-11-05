// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResponseError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError()';
}


}

/// @nodoc
class $ResponseErrorCopyWith<$Res>  {
$ResponseErrorCopyWith(ResponseError _, $Res Function(ResponseError) __);
}


/// Adds pattern-matching-related methods to [ResponseError].
extension ResponseErrorPatterns on ResponseError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BadResponse value)?  badResponse,TResult Function( NotFound value)?  notFound,TResult Function( UnAuthorized value)?  unAuthorized,TResult Function( NoInternetConnection value)?  noInternetConnection,TResult Function( UnExpected value)?  unExcepted,TResult Function( Response value)?  response,TResult Function( SendTimeOut value)?  sendTimeOut,TResult Function( ConnectionTimeOut value)?  connectionTimeOut,TResult Function( ReceiveTimeOut value)?  receiveTimeOut,TResult Function( Cancel value)?  cancel,TResult Function( Unknown value)?  unknown,TResult Function( Conflict value)?  conflict,TResult Function( UnProcessable value)?  unProcessable,TResult Function( TooManyRequest value)?  tooManyRequest,TResult Function( InternalServerError value)?  internalServerError,TResult Function( BadGetWay value)?  badGetWay,TResult Function( ErrorWithMessage value)?  errorWithMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BadResponse() when badResponse != null:
return badResponse(_that);case NotFound() when notFound != null:
return notFound(_that);case UnAuthorized() when unAuthorized != null:
return unAuthorized(_that);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that);case UnExpected() when unExcepted != null:
return unExcepted(_that);case Response() when response != null:
return response(_that);case SendTimeOut() when sendTimeOut != null:
return sendTimeOut(_that);case ConnectionTimeOut() when connectionTimeOut != null:
return connectionTimeOut(_that);case ReceiveTimeOut() when receiveTimeOut != null:
return receiveTimeOut(_that);case Cancel() when cancel != null:
return cancel(_that);case Unknown() when unknown != null:
return unknown(_that);case Conflict() when conflict != null:
return conflict(_that);case UnProcessable() when unProcessable != null:
return unProcessable(_that);case TooManyRequest() when tooManyRequest != null:
return tooManyRequest(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case BadGetWay() when badGetWay != null:
return badGetWay(_that);case ErrorWithMessage() when errorWithMessage != null:
return errorWithMessage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BadResponse value)  badResponse,required TResult Function( NotFound value)  notFound,required TResult Function( UnAuthorized value)  unAuthorized,required TResult Function( NoInternetConnection value)  noInternetConnection,required TResult Function( UnExpected value)  unExcepted,required TResult Function( Response value)  response,required TResult Function( SendTimeOut value)  sendTimeOut,required TResult Function( ConnectionTimeOut value)  connectionTimeOut,required TResult Function( ReceiveTimeOut value)  receiveTimeOut,required TResult Function( Cancel value)  cancel,required TResult Function( Unknown value)  unknown,required TResult Function( Conflict value)  conflict,required TResult Function( UnProcessable value)  unProcessable,required TResult Function( TooManyRequest value)  tooManyRequest,required TResult Function( InternalServerError value)  internalServerError,required TResult Function( BadGetWay value)  badGetWay,required TResult Function( ErrorWithMessage value)  errorWithMessage,}){
final _that = this;
switch (_that) {
case BadResponse():
return badResponse(_that);case NotFound():
return notFound(_that);case UnAuthorized():
return unAuthorized(_that);case NoInternetConnection():
return noInternetConnection(_that);case UnExpected():
return unExcepted(_that);case Response():
return response(_that);case SendTimeOut():
return sendTimeOut(_that);case ConnectionTimeOut():
return connectionTimeOut(_that);case ReceiveTimeOut():
return receiveTimeOut(_that);case Cancel():
return cancel(_that);case Unknown():
return unknown(_that);case Conflict():
return conflict(_that);case UnProcessable():
return unProcessable(_that);case TooManyRequest():
return tooManyRequest(_that);case InternalServerError():
return internalServerError(_that);case BadGetWay():
return badGetWay(_that);case ErrorWithMessage():
return errorWithMessage(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BadResponse value)?  badResponse,TResult? Function( NotFound value)?  notFound,TResult? Function( UnAuthorized value)?  unAuthorized,TResult? Function( NoInternetConnection value)?  noInternetConnection,TResult? Function( UnExpected value)?  unExcepted,TResult? Function( Response value)?  response,TResult? Function( SendTimeOut value)?  sendTimeOut,TResult? Function( ConnectionTimeOut value)?  connectionTimeOut,TResult? Function( ReceiveTimeOut value)?  receiveTimeOut,TResult? Function( Cancel value)?  cancel,TResult? Function( Unknown value)?  unknown,TResult? Function( Conflict value)?  conflict,TResult? Function( UnProcessable value)?  unProcessable,TResult? Function( TooManyRequest value)?  tooManyRequest,TResult? Function( InternalServerError value)?  internalServerError,TResult? Function( BadGetWay value)?  badGetWay,TResult? Function( ErrorWithMessage value)?  errorWithMessage,}){
final _that = this;
switch (_that) {
case BadResponse() when badResponse != null:
return badResponse(_that);case NotFound() when notFound != null:
return notFound(_that);case UnAuthorized() when unAuthorized != null:
return unAuthorized(_that);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that);case UnExpected() when unExcepted != null:
return unExcepted(_that);case Response() when response != null:
return response(_that);case SendTimeOut() when sendTimeOut != null:
return sendTimeOut(_that);case ConnectionTimeOut() when connectionTimeOut != null:
return connectionTimeOut(_that);case ReceiveTimeOut() when receiveTimeOut != null:
return receiveTimeOut(_that);case Cancel() when cancel != null:
return cancel(_that);case Unknown() when unknown != null:
return unknown(_that);case Conflict() when conflict != null:
return conflict(_that);case UnProcessable() when unProcessable != null:
return unProcessable(_that);case TooManyRequest() when tooManyRequest != null:
return tooManyRequest(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case BadGetWay() when badGetWay != null:
return badGetWay(_that);case ErrorWithMessage() when errorWithMessage != null:
return errorWithMessage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  badResponse,TResult Function()?  notFound,TResult Function()?  unAuthorized,TResult Function()?  noInternetConnection,TResult Function()?  unExcepted,TResult Function()?  response,TResult Function()?  sendTimeOut,TResult Function()?  connectionTimeOut,TResult Function()?  receiveTimeOut,TResult Function()?  cancel,TResult Function()?  unknown,TResult Function()?  conflict,TResult Function()?  unProcessable,TResult Function()?  tooManyRequest,TResult Function()?  internalServerError,TResult Function()?  badGetWay,TResult Function( String errorMessage)?  errorWithMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BadResponse() when badResponse != null:
return badResponse();case NotFound() when notFound != null:
return notFound();case UnAuthorized() when unAuthorized != null:
return unAuthorized();case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection();case UnExpected() when unExcepted != null:
return unExcepted();case Response() when response != null:
return response();case SendTimeOut() when sendTimeOut != null:
return sendTimeOut();case ConnectionTimeOut() when connectionTimeOut != null:
return connectionTimeOut();case ReceiveTimeOut() when receiveTimeOut != null:
return receiveTimeOut();case Cancel() when cancel != null:
return cancel();case Unknown() when unknown != null:
return unknown();case Conflict() when conflict != null:
return conflict();case UnProcessable() when unProcessable != null:
return unProcessable();case TooManyRequest() when tooManyRequest != null:
return tooManyRequest();case InternalServerError() when internalServerError != null:
return internalServerError();case BadGetWay() when badGetWay != null:
return badGetWay();case ErrorWithMessage() when errorWithMessage != null:
return errorWithMessage(_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  badResponse,required TResult Function()  notFound,required TResult Function()  unAuthorized,required TResult Function()  noInternetConnection,required TResult Function()  unExcepted,required TResult Function()  response,required TResult Function()  sendTimeOut,required TResult Function()  connectionTimeOut,required TResult Function()  receiveTimeOut,required TResult Function()  cancel,required TResult Function()  unknown,required TResult Function()  conflict,required TResult Function()  unProcessable,required TResult Function()  tooManyRequest,required TResult Function()  internalServerError,required TResult Function()  badGetWay,required TResult Function( String errorMessage)  errorWithMessage,}) {final _that = this;
switch (_that) {
case BadResponse():
return badResponse();case NotFound():
return notFound();case UnAuthorized():
return unAuthorized();case NoInternetConnection():
return noInternetConnection();case UnExpected():
return unExcepted();case Response():
return response();case SendTimeOut():
return sendTimeOut();case ConnectionTimeOut():
return connectionTimeOut();case ReceiveTimeOut():
return receiveTimeOut();case Cancel():
return cancel();case Unknown():
return unknown();case Conflict():
return conflict();case UnProcessable():
return unProcessable();case TooManyRequest():
return tooManyRequest();case InternalServerError():
return internalServerError();case BadGetWay():
return badGetWay();case ErrorWithMessage():
return errorWithMessage(_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  badResponse,TResult? Function()?  notFound,TResult? Function()?  unAuthorized,TResult? Function()?  noInternetConnection,TResult? Function()?  unExcepted,TResult? Function()?  response,TResult? Function()?  sendTimeOut,TResult? Function()?  connectionTimeOut,TResult? Function()?  receiveTimeOut,TResult? Function()?  cancel,TResult? Function()?  unknown,TResult? Function()?  conflict,TResult? Function()?  unProcessable,TResult? Function()?  tooManyRequest,TResult? Function()?  internalServerError,TResult? Function()?  badGetWay,TResult? Function( String errorMessage)?  errorWithMessage,}) {final _that = this;
switch (_that) {
case BadResponse() when badResponse != null:
return badResponse();case NotFound() when notFound != null:
return notFound();case UnAuthorized() when unAuthorized != null:
return unAuthorized();case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection();case UnExpected() when unExcepted != null:
return unExcepted();case Response() when response != null:
return response();case SendTimeOut() when sendTimeOut != null:
return sendTimeOut();case ConnectionTimeOut() when connectionTimeOut != null:
return connectionTimeOut();case ReceiveTimeOut() when receiveTimeOut != null:
return receiveTimeOut();case Cancel() when cancel != null:
return cancel();case Unknown() when unknown != null:
return unknown();case Conflict() when conflict != null:
return conflict();case UnProcessable() when unProcessable != null:
return unProcessable();case TooManyRequest() when tooManyRequest != null:
return tooManyRequest();case InternalServerError() when internalServerError != null:
return internalServerError();case BadGetWay() when badGetWay != null:
return badGetWay();case ErrorWithMessage() when errorWithMessage != null:
return errorWithMessage(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class BadResponse extends ResponseError {
  const BadResponse(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadResponse);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.badResponse()';
}


}




/// @nodoc


class NotFound extends ResponseError {
  const NotFound(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.notFound()';
}


}




/// @nodoc


class UnAuthorized extends ResponseError {
  const UnAuthorized(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnAuthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.unAuthorized()';
}


}




/// @nodoc


class NoInternetConnection extends ResponseError {
  const NoInternetConnection(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoInternetConnection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.noInternetConnection()';
}


}




/// @nodoc


class UnExpected extends ResponseError {
  const UnExpected(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnExpected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.unExcepted()';
}


}




/// @nodoc


class Response extends ResponseError {
  const Response(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Response);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.response()';
}


}




/// @nodoc


class SendTimeOut extends ResponseError {
  const SendTimeOut(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendTimeOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.sendTimeOut()';
}


}




/// @nodoc


class ConnectionTimeOut extends ResponseError {
  const ConnectionTimeOut(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionTimeOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.connectionTimeOut()';
}


}




/// @nodoc


class ReceiveTimeOut extends ResponseError {
  const ReceiveTimeOut(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveTimeOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.receiveTimeOut()';
}


}




/// @nodoc


class Cancel extends ResponseError {
  const Cancel(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cancel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.cancel()';
}


}




/// @nodoc


class Unknown extends ResponseError {
  const Unknown(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.unknown()';
}


}




/// @nodoc


class Conflict extends ResponseError {
  const Conflict(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conflict);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.conflict()';
}


}




/// @nodoc


class UnProcessable extends ResponseError {
  const UnProcessable(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnProcessable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.unProcessable()';
}


}




/// @nodoc


class TooManyRequest extends ResponseError {
  const TooManyRequest(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TooManyRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.tooManyRequest()';
}


}




/// @nodoc


class InternalServerError extends ResponseError {
  const InternalServerError(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternalServerError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.internalServerError()';
}


}




/// @nodoc


class BadGetWay extends ResponseError {
  const BadGetWay(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadGetWay);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResponseError.badGetWay()';
}


}




/// @nodoc


class ErrorWithMessage extends ResponseError {
  const ErrorWithMessage(this.errorMessage): super._();
  

 final  String errorMessage;

/// Create a copy of ResponseError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorWithMessageCopyWith<ErrorWithMessage> get copyWith => _$ErrorWithMessageCopyWithImpl<ErrorWithMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorWithMessage&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'ResponseError.errorWithMessage(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ErrorWithMessageCopyWith<$Res> implements $ResponseErrorCopyWith<$Res> {
  factory $ErrorWithMessageCopyWith(ErrorWithMessage value, $Res Function(ErrorWithMessage) _then) = _$ErrorWithMessageCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$ErrorWithMessageCopyWithImpl<$Res>
    implements $ErrorWithMessageCopyWith<$Res> {
  _$ErrorWithMessageCopyWithImpl(this._self, this._then);

  final ErrorWithMessage _self;
  final $Res Function(ErrorWithMessage) _then;

/// Create a copy of ResponseError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(ErrorWithMessage(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
