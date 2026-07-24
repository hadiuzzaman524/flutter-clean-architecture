// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_locale_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppLocaleState {

 List<Locale> get supportedLocales;/// `null` means "follow the system locale".
 Locale? get currentLocale;
/// Create a copy of AppLocaleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppLocaleStateCopyWith<AppLocaleState> get copyWith => _$AppLocaleStateCopyWithImpl<AppLocaleState>(this as AppLocaleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLocaleState&&const DeepCollectionEquality().equals(other.supportedLocales, supportedLocales)&&(identical(other.currentLocale, currentLocale) || other.currentLocale == currentLocale));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(supportedLocales),currentLocale);

@override
String toString() {
  return 'AppLocaleState(supportedLocales: $supportedLocales, currentLocale: $currentLocale)';
}


}

/// @nodoc
abstract mixin class $AppLocaleStateCopyWith<$Res>  {
  factory $AppLocaleStateCopyWith(AppLocaleState value, $Res Function(AppLocaleState) _then) = _$AppLocaleStateCopyWithImpl;
@useResult
$Res call({
 List<Locale> supportedLocales, Locale? currentLocale
});




}
/// @nodoc
class _$AppLocaleStateCopyWithImpl<$Res>
    implements $AppLocaleStateCopyWith<$Res> {
  _$AppLocaleStateCopyWithImpl(this._self, this._then);

  final AppLocaleState _self;
  final $Res Function(AppLocaleState) _then;

/// Create a copy of AppLocaleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? supportedLocales = null,Object? currentLocale = freezed,}) {
  return _then(_self.copyWith(
supportedLocales: null == supportedLocales ? _self.supportedLocales : supportedLocales // ignore: cast_nullable_to_non_nullable
as List<Locale>,currentLocale: freezed == currentLocale ? _self.currentLocale : currentLocale // ignore: cast_nullable_to_non_nullable
as Locale?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppLocaleState].
extension AppLocaleStatePatterns on AppLocaleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppLocaleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppLocaleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppLocaleState value)  $default,){
final _that = this;
switch (_that) {
case _AppLocaleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppLocaleState value)?  $default,){
final _that = this;
switch (_that) {
case _AppLocaleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Locale> supportedLocales,  Locale? currentLocale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppLocaleState() when $default != null:
return $default(_that.supportedLocales,_that.currentLocale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Locale> supportedLocales,  Locale? currentLocale)  $default,) {final _that = this;
switch (_that) {
case _AppLocaleState():
return $default(_that.supportedLocales,_that.currentLocale);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Locale> supportedLocales,  Locale? currentLocale)?  $default,) {final _that = this;
switch (_that) {
case _AppLocaleState() when $default != null:
return $default(_that.supportedLocales,_that.currentLocale);case _:
  return null;

}
}

}

/// @nodoc


class _AppLocaleState implements AppLocaleState {
  const _AppLocaleState({required final  List<Locale> supportedLocales, this.currentLocale}): _supportedLocales = supportedLocales;
  

 final  List<Locale> _supportedLocales;
@override List<Locale> get supportedLocales {
  if (_supportedLocales is EqualUnmodifiableListView) return _supportedLocales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedLocales);
}

/// `null` means "follow the system locale".
@override final  Locale? currentLocale;

/// Create a copy of AppLocaleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppLocaleStateCopyWith<_AppLocaleState> get copyWith => __$AppLocaleStateCopyWithImpl<_AppLocaleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppLocaleState&&const DeepCollectionEquality().equals(other._supportedLocales, _supportedLocales)&&(identical(other.currentLocale, currentLocale) || other.currentLocale == currentLocale));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_supportedLocales),currentLocale);

@override
String toString() {
  return 'AppLocaleState(supportedLocales: $supportedLocales, currentLocale: $currentLocale)';
}


}

/// @nodoc
abstract mixin class _$AppLocaleStateCopyWith<$Res> implements $AppLocaleStateCopyWith<$Res> {
  factory _$AppLocaleStateCopyWith(_AppLocaleState value, $Res Function(_AppLocaleState) _then) = __$AppLocaleStateCopyWithImpl;
@override @useResult
$Res call({
 List<Locale> supportedLocales, Locale? currentLocale
});




}
/// @nodoc
class __$AppLocaleStateCopyWithImpl<$Res>
    implements _$AppLocaleStateCopyWith<$Res> {
  __$AppLocaleStateCopyWithImpl(this._self, this._then);

  final _AppLocaleState _self;
  final $Res Function(_AppLocaleState) _then;

/// Create a copy of AppLocaleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? supportedLocales = null,Object? currentLocale = freezed,}) {
  return _then(_AppLocaleState(
supportedLocales: null == supportedLocales ? _self._supportedLocales : supportedLocales // ignore: cast_nullable_to_non_nullable
as List<Locale>,currentLocale: freezed == currentLocale ? _self.currentLocale : currentLocale // ignore: cast_nullable_to_non_nullable
as Locale?,
  ));
}


}

// dart format on
