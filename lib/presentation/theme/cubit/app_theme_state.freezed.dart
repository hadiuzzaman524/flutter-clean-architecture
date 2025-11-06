// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppThemeState {

 List<ThemeEntity> get themes; ThemeEntity get currentTheme;
/// Create a copy of AppThemeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppThemeStateCopyWith<AppThemeState> get copyWith => _$AppThemeStateCopyWithImpl<AppThemeState>(this as AppThemeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppThemeState&&const DeepCollectionEquality().equals(other.themes, themes)&&(identical(other.currentTheme, currentTheme) || other.currentTheme == currentTheme));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(themes),currentTheme);

@override
String toString() {
  return 'AppThemeState(themes: $themes, currentTheme: $currentTheme)';
}


}

/// @nodoc
abstract mixin class $AppThemeStateCopyWith<$Res>  {
  factory $AppThemeStateCopyWith(AppThemeState value, $Res Function(AppThemeState) _then) = _$AppThemeStateCopyWithImpl;
@useResult
$Res call({
 List<ThemeEntity> themes, ThemeEntity currentTheme
});




}
/// @nodoc
class _$AppThemeStateCopyWithImpl<$Res>
    implements $AppThemeStateCopyWith<$Res> {
  _$AppThemeStateCopyWithImpl(this._self, this._then);

  final AppThemeState _self;
  final $Res Function(AppThemeState) _then;

/// Create a copy of AppThemeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themes = null,Object? currentTheme = null,}) {
  return _then(_self.copyWith(
themes: null == themes ? _self.themes : themes // ignore: cast_nullable_to_non_nullable
as List<ThemeEntity>,currentTheme: null == currentTheme ? _self.currentTheme : currentTheme // ignore: cast_nullable_to_non_nullable
as ThemeEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [AppThemeState].
extension AppThemeStatePatterns on AppThemeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppThemeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppThemeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppThemeState value)  $default,){
final _that = this;
switch (_that) {
case _AppThemeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppThemeState value)?  $default,){
final _that = this;
switch (_that) {
case _AppThemeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ThemeEntity> themes,  ThemeEntity currentTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppThemeState() when $default != null:
return $default(_that.themes,_that.currentTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ThemeEntity> themes,  ThemeEntity currentTheme)  $default,) {final _that = this;
switch (_that) {
case _AppThemeState():
return $default(_that.themes,_that.currentTheme);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ThemeEntity> themes,  ThemeEntity currentTheme)?  $default,) {final _that = this;
switch (_that) {
case _AppThemeState() when $default != null:
return $default(_that.themes,_that.currentTheme);case _:
  return null;

}
}

}

/// @nodoc


class _AppThemeState implements AppThemeState {
  const _AppThemeState({required final  List<ThemeEntity> themes, required this.currentTheme}): _themes = themes;
  

 final  List<ThemeEntity> _themes;
@override List<ThemeEntity> get themes {
  if (_themes is EqualUnmodifiableListView) return _themes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_themes);
}

@override final  ThemeEntity currentTheme;

/// Create a copy of AppThemeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppThemeStateCopyWith<_AppThemeState> get copyWith => __$AppThemeStateCopyWithImpl<_AppThemeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppThemeState&&const DeepCollectionEquality().equals(other._themes, _themes)&&(identical(other.currentTheme, currentTheme) || other.currentTheme == currentTheme));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_themes),currentTheme);

@override
String toString() {
  return 'AppThemeState(themes: $themes, currentTheme: $currentTheme)';
}


}

/// @nodoc
abstract mixin class _$AppThemeStateCopyWith<$Res> implements $AppThemeStateCopyWith<$Res> {
  factory _$AppThemeStateCopyWith(_AppThemeState value, $Res Function(_AppThemeState) _then) = __$AppThemeStateCopyWithImpl;
@override @useResult
$Res call({
 List<ThemeEntity> themes, ThemeEntity currentTheme
});




}
/// @nodoc
class __$AppThemeStateCopyWithImpl<$Res>
    implements _$AppThemeStateCopyWith<$Res> {
  __$AppThemeStateCopyWithImpl(this._self, this._then);

  final _AppThemeState _self;
  final $Res Function(_AppThemeState) _then;

/// Create a copy of AppThemeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themes = null,Object? currentTheme = null,}) {
  return _then(_AppThemeState(
themes: null == themes ? _self._themes : themes // ignore: cast_nullable_to_non_nullable
as List<ThemeEntity>,currentTheme: null == currentTheme ? _self.currentTheme : currentTheme // ignore: cast_nullable_to_non_nullable
as ThemeEntity,
  ));
}


}

// dart format on
