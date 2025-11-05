// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserResponseModel {

 int? get id; String? get name; String? get username; String? get email; Address? get address; String? get phone; String? get website; Company? get company;
/// Create a copy of UserResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserResponseModelCopyWith<UserResponseModel> get copyWith => _$UserResponseModelCopyWithImpl<UserResponseModel>(this as UserResponseModel, _$identity);

  /// Serializes this UserResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&(identical(other.company, company) || other.company == company));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email,address,phone,website,company);

@override
String toString() {
  return 'UserResponseModel(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
}


}

/// @nodoc
abstract mixin class $UserResponseModelCopyWith<$Res>  {
  factory $UserResponseModelCopyWith(UserResponseModel value, $Res Function(UserResponseModel) _then) = _$UserResponseModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? username, String? email, Address? address, String? phone, String? website, Company? company
});


$AddressCopyWith<$Res>? get address;$CompanyCopyWith<$Res>? get company;

}
/// @nodoc
class _$UserResponseModelCopyWithImpl<$Res>
    implements $UserResponseModelCopyWith<$Res> {
  _$UserResponseModelCopyWithImpl(this._self, this._then);

  final UserResponseModel _self;
  final $Res Function(UserResponseModel) _then;

/// Create a copy of UserResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? username = freezed,Object? email = freezed,Object? address = freezed,Object? phone = freezed,Object? website = freezed,Object? company = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company?,
  ));
}
/// Create a copy of UserResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of UserResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $CompanyCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserResponseModel].
extension UserResponseModelPatterns on UserResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _UserResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? username,  String? email,  Address? address,  String? phone,  String? website,  Company? company)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserResponseModel() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.email,_that.address,_that.phone,_that.website,_that.company);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? username,  String? email,  Address? address,  String? phone,  String? website,  Company? company)  $default,) {final _that = this;
switch (_that) {
case _UserResponseModel():
return $default(_that.id,_that.name,_that.username,_that.email,_that.address,_that.phone,_that.website,_that.company);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? username,  String? email,  Address? address,  String? phone,  String? website,  Company? company)?  $default,) {final _that = this;
switch (_that) {
case _UserResponseModel() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.email,_that.address,_that.phone,_that.website,_that.company);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserResponseModel implements UserResponseModel {
  const _UserResponseModel({this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company});
  factory _UserResponseModel.fromJson(Map<String, dynamic> json) => _$UserResponseModelFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? username;
@override final  String? email;
@override final  Address? address;
@override final  String? phone;
@override final  String? website;
@override final  Company? company;

/// Create a copy of UserResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserResponseModelCopyWith<_UserResponseModel> get copyWith => __$UserResponseModelCopyWithImpl<_UserResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&(identical(other.company, company) || other.company == company));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email,address,phone,website,company);

@override
String toString() {
  return 'UserResponseModel(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
}


}

/// @nodoc
abstract mixin class _$UserResponseModelCopyWith<$Res> implements $UserResponseModelCopyWith<$Res> {
  factory _$UserResponseModelCopyWith(_UserResponseModel value, $Res Function(_UserResponseModel) _then) = __$UserResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? username, String? email, Address? address, String? phone, String? website, Company? company
});


@override $AddressCopyWith<$Res>? get address;@override $CompanyCopyWith<$Res>? get company;

}
/// @nodoc
class __$UserResponseModelCopyWithImpl<$Res>
    implements _$UserResponseModelCopyWith<$Res> {
  __$UserResponseModelCopyWithImpl(this._self, this._then);

  final _UserResponseModel _self;
  final $Res Function(_UserResponseModel) _then;

/// Create a copy of UserResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? username = freezed,Object? email = freezed,Object? address = freezed,Object? phone = freezed,Object? website = freezed,Object? company = freezed,}) {
  return _then(_UserResponseModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company?,
  ));
}

/// Create a copy of UserResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of UserResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $CompanyCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}
}


/// @nodoc
mixin _$Address {

 String? get street; String? get suite; String? get city; String? get zipcode; Geo? get geo;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.street, street) || other.street == street)&&(identical(other.suite, suite) || other.suite == suite)&&(identical(other.city, city) || other.city == city)&&(identical(other.zipcode, zipcode) || other.zipcode == zipcode)&&(identical(other.geo, geo) || other.geo == geo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,suite,city,zipcode,geo);

@override
String toString() {
  return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 String? street, String? suite, String? city, String? zipcode, Geo? geo
});


$GeoCopyWith<$Res>? get geo;

}
/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? street = freezed,Object? suite = freezed,Object? city = freezed,Object? zipcode = freezed,Object? geo = freezed,}) {
  return _then(_self.copyWith(
street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String?,suite: freezed == suite ? _self.suite : suite // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,zipcode: freezed == zipcode ? _self.zipcode : zipcode // ignore: cast_nullable_to_non_nullable
as String?,geo: freezed == geo ? _self.geo : geo // ignore: cast_nullable_to_non_nullable
as Geo?,
  ));
}
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoCopyWith<$Res>? get geo {
    if (_self.geo == null) {
    return null;
  }

  return $GeoCopyWith<$Res>(_self.geo!, (value) {
    return _then(_self.copyWith(geo: value));
  });
}
}


/// Adds pattern-matching-related methods to [Address].
extension AddressPatterns on Address {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Address value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Address value)  $default,){
final _that = this;
switch (_that) {
case _Address():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Address value)?  $default,){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? street,  String? suite,  String? city,  String? zipcode,  Geo? geo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.street,_that.suite,_that.city,_that.zipcode,_that.geo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? street,  String? suite,  String? city,  String? zipcode,  Geo? geo)  $default,) {final _that = this;
switch (_that) {
case _Address():
return $default(_that.street,_that.suite,_that.city,_that.zipcode,_that.geo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? street,  String? suite,  String? city,  String? zipcode,  Geo? geo)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.street,_that.suite,_that.city,_that.zipcode,_that.geo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Address implements Address {
  const _Address({this.street, this.suite, this.city, this.zipcode, this.geo});
  factory _Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

@override final  String? street;
@override final  String? suite;
@override final  String? city;
@override final  String? zipcode;
@override final  Geo? geo;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressCopyWith<_Address> get copyWith => __$AddressCopyWithImpl<_Address>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.street, street) || other.street == street)&&(identical(other.suite, suite) || other.suite == suite)&&(identical(other.city, city) || other.city == city)&&(identical(other.zipcode, zipcode) || other.zipcode == zipcode)&&(identical(other.geo, geo) || other.geo == geo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,suite,city,zipcode,geo);

@override
String toString() {
  return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 String? street, String? suite, String? city, String? zipcode, Geo? geo
});


@override $GeoCopyWith<$Res>? get geo;

}
/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? street = freezed,Object? suite = freezed,Object? city = freezed,Object? zipcode = freezed,Object? geo = freezed,}) {
  return _then(_Address(
street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String?,suite: freezed == suite ? _self.suite : suite // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,zipcode: freezed == zipcode ? _self.zipcode : zipcode // ignore: cast_nullable_to_non_nullable
as String?,geo: freezed == geo ? _self.geo : geo // ignore: cast_nullable_to_non_nullable
as Geo?,
  ));
}

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoCopyWith<$Res>? get geo {
    if (_self.geo == null) {
    return null;
  }

  return $GeoCopyWith<$Res>(_self.geo!, (value) {
    return _then(_self.copyWith(geo: value));
  });
}
}


/// @nodoc
mixin _$Geo {

 String? get lat; String? get lng;
/// Create a copy of Geo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoCopyWith<Geo> get copyWith => _$GeoCopyWithImpl<Geo>(this as Geo, _$identity);

  /// Serializes this Geo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Geo&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'Geo(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $GeoCopyWith<$Res>  {
  factory $GeoCopyWith(Geo value, $Res Function(Geo) _then) = _$GeoCopyWithImpl;
@useResult
$Res call({
 String? lat, String? lng
});




}
/// @nodoc
class _$GeoCopyWithImpl<$Res>
    implements $GeoCopyWith<$Res> {
  _$GeoCopyWithImpl(this._self, this._then);

  final Geo _self;
  final $Res Function(Geo) _then;

/// Create a copy of Geo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Geo].
extension GeoPatterns on Geo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Geo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Geo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Geo value)  $default,){
final _that = this;
switch (_that) {
case _Geo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Geo value)?  $default,){
final _that = this;
switch (_that) {
case _Geo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? lat,  String? lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Geo() when $default != null:
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? lat,  String? lng)  $default,) {final _that = this;
switch (_that) {
case _Geo():
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? lat,  String? lng)?  $default,) {final _that = this;
switch (_that) {
case _Geo() when $default != null:
return $default(_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Geo implements Geo {
  const _Geo({this.lat, this.lng});
  factory _Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

@override final  String? lat;
@override final  String? lng;

/// Create a copy of Geo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoCopyWith<_Geo> get copyWith => __$GeoCopyWithImpl<_Geo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Geo&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'Geo(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$GeoCopyWith<$Res> implements $GeoCopyWith<$Res> {
  factory _$GeoCopyWith(_Geo value, $Res Function(_Geo) _then) = __$GeoCopyWithImpl;
@override @useResult
$Res call({
 String? lat, String? lng
});




}
/// @nodoc
class __$GeoCopyWithImpl<$Res>
    implements _$GeoCopyWith<$Res> {
  __$GeoCopyWithImpl(this._self, this._then);

  final _Geo _self;
  final $Res Function(_Geo) _then;

/// Create a copy of Geo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_Geo(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Company {

 String? get name; String? get catchPhrase; String? get bs;
/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyCopyWith<Company> get copyWith => _$CompanyCopyWithImpl<Company>(this as Company, _$identity);

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Company&&(identical(other.name, name) || other.name == name)&&(identical(other.catchPhrase, catchPhrase) || other.catchPhrase == catchPhrase)&&(identical(other.bs, bs) || other.bs == bs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,catchPhrase,bs);

@override
String toString() {
  return 'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
}


}

/// @nodoc
abstract mixin class $CompanyCopyWith<$Res>  {
  factory $CompanyCopyWith(Company value, $Res Function(Company) _then) = _$CompanyCopyWithImpl;
@useResult
$Res call({
 String? name, String? catchPhrase, String? bs
});




}
/// @nodoc
class _$CompanyCopyWithImpl<$Res>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._self, this._then);

  final Company _self;
  final $Res Function(Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? catchPhrase = freezed,Object? bs = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,catchPhrase: freezed == catchPhrase ? _self.catchPhrase : catchPhrase // ignore: cast_nullable_to_non_nullable
as String?,bs: freezed == bs ? _self.bs : bs // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Company].
extension CompanyPatterns on Company {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Company value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Company value)  $default,){
final _that = this;
switch (_that) {
case _Company():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Company value)?  $default,){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? catchPhrase,  String? bs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.name,_that.catchPhrase,_that.bs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? catchPhrase,  String? bs)  $default,) {final _that = this;
switch (_that) {
case _Company():
return $default(_that.name,_that.catchPhrase,_that.bs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? catchPhrase,  String? bs)?  $default,) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.name,_that.catchPhrase,_that.bs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Company implements Company {
  const _Company({this.name, this.catchPhrase, this.bs});
  factory _Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

@override final  String? name;
@override final  String? catchPhrase;
@override final  String? bs;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyCopyWith<_Company> get copyWith => __$CompanyCopyWithImpl<_Company>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Company&&(identical(other.name, name) || other.name == name)&&(identical(other.catchPhrase, catchPhrase) || other.catchPhrase == catchPhrase)&&(identical(other.bs, bs) || other.bs == bs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,catchPhrase,bs);

@override
String toString() {
  return 'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
}


}

/// @nodoc
abstract mixin class _$CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$CompanyCopyWith(_Company value, $Res Function(_Company) _then) = __$CompanyCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? catchPhrase, String? bs
});




}
/// @nodoc
class __$CompanyCopyWithImpl<$Res>
    implements _$CompanyCopyWith<$Res> {
  __$CompanyCopyWithImpl(this._self, this._then);

  final _Company _self;
  final $Res Function(_Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? catchPhrase = freezed,Object? bs = freezed,}) {
  return _then(_Company(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,catchPhrase: freezed == catchPhrase ? _self.catchPhrase : catchPhrase // ignore: cast_nullable_to_non_nullable
as String?,bs: freezed == bs ? _self.bs : bs // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
