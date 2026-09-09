// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_socket_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WebSocketState {

 WebSocketStatus get status; List<String> get messages; String? get error;
/// Create a copy of WebSocketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebSocketStateCopyWith<WebSocketState> get copyWith => _$WebSocketStateCopyWithImpl<WebSocketState>(this as WebSocketState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebSocketState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(messages),error);

@override
String toString() {
  return 'WebSocketState(status: $status, messages: $messages, error: $error)';
}


}

/// @nodoc
abstract mixin class $WebSocketStateCopyWith<$Res>  {
  factory $WebSocketStateCopyWith(WebSocketState value, $Res Function(WebSocketState) _then) = _$WebSocketStateCopyWithImpl;
@useResult
$Res call({
 WebSocketStatus status, List<String> messages, String? error
});




}
/// @nodoc
class _$WebSocketStateCopyWithImpl<$Res>
    implements $WebSocketStateCopyWith<$Res> {
  _$WebSocketStateCopyWithImpl(this._self, this._then);

  final WebSocketState _self;
  final $Res Function(WebSocketState) _then;

/// Create a copy of WebSocketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? messages = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WebSocketStatus,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<String>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WebSocketState].
extension WebSocketStatePatterns on WebSocketState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WebSocketState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WebSocketState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WebSocketState value)  $default,){
final _that = this;
switch (_that) {
case _WebSocketState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WebSocketState value)?  $default,){
final _that = this;
switch (_that) {
case _WebSocketState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WebSocketStatus status,  List<String> messages,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WebSocketState() when $default != null:
return $default(_that.status,_that.messages,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WebSocketStatus status,  List<String> messages,  String? error)  $default,) {final _that = this;
switch (_that) {
case _WebSocketState():
return $default(_that.status,_that.messages,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WebSocketStatus status,  List<String> messages,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _WebSocketState() when $default != null:
return $default(_that.status,_that.messages,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WebSocketState implements WebSocketState {
  const _WebSocketState({required this.status, final  List<String> messages = const [], this.error}): _messages = messages;
  

@override final  WebSocketStatus status;
 final  List<String> _messages;
@override@JsonKey() List<String> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  String? error;

/// Create a copy of WebSocketState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebSocketStateCopyWith<_WebSocketState> get copyWith => __$WebSocketStateCopyWithImpl<_WebSocketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebSocketState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_messages),error);

@override
String toString() {
  return 'WebSocketState(status: $status, messages: $messages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WebSocketStateCopyWith<$Res> implements $WebSocketStateCopyWith<$Res> {
  factory _$WebSocketStateCopyWith(_WebSocketState value, $Res Function(_WebSocketState) _then) = __$WebSocketStateCopyWithImpl;
@override @useResult
$Res call({
 WebSocketStatus status, List<String> messages, String? error
});




}
/// @nodoc
class __$WebSocketStateCopyWithImpl<$Res>
    implements _$WebSocketStateCopyWith<$Res> {
  __$WebSocketStateCopyWithImpl(this._self, this._then);

  final _WebSocketState _self;
  final $Res Function(_WebSocketState) _then;

/// Create a copy of WebSocketState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? messages = null,Object? error = freezed,}) {
  return _then(_WebSocketState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WebSocketStatus,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<String>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
