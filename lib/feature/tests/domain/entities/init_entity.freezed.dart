// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'init_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InitEntity _$InitEntityFromJson(Map<String, dynamic> json) {
  return _InitEntity.fromJson(json);
}

/// @nodoc
mixin _$InitEntity {
  @JsonKey(name: "hostname")
  String get hostname => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitEntityCopyWith<InitEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitEntityCopyWith<$Res> {
  factory $InitEntityCopyWith(
          InitEntity value, $Res Function(InitEntity) then) =
      _$InitEntityCopyWithImpl<$Res, InitEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: "hostname") String hostname,
      @JsonKey(name: "password") String password,
      @JsonKey(name: "username") String username});
}

/// @nodoc
class _$InitEntityCopyWithImpl<$Res, $Val extends InitEntity>
    implements $InitEntityCopyWith<$Res> {
  _$InitEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostname = null,
    Object? password = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      hostname: null == hostname
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitEntityImplCopyWith<$Res>
    implements $InitEntityCopyWith<$Res> {
  factory _$$InitEntityImplCopyWith(
          _$InitEntityImpl value, $Res Function(_$InitEntityImpl) then) =
      __$$InitEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "hostname") String hostname,
      @JsonKey(name: "password") String password,
      @JsonKey(name: "username") String username});
}

/// @nodoc
class __$$InitEntityImplCopyWithImpl<$Res>
    extends _$InitEntityCopyWithImpl<$Res, _$InitEntityImpl>
    implements _$$InitEntityImplCopyWith<$Res> {
  __$$InitEntityImplCopyWithImpl(
      _$InitEntityImpl _value, $Res Function(_$InitEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostname = null,
    Object? password = null,
    Object? username = null,
  }) {
    return _then(_$InitEntityImpl(
      hostname: null == hostname
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InitEntityImpl implements _InitEntity {
  const _$InitEntityImpl(
      {@JsonKey(name: "hostname") required this.hostname,
      @JsonKey(name: "password") required this.password,
      @JsonKey(name: "username") required this.username});

  factory _$InitEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitEntityImplFromJson(json);

  @override
  @JsonKey(name: "hostname")
  final String hostname;
  @override
  @JsonKey(name: "password")
  final String password;
  @override
  @JsonKey(name: "username")
  final String username;

  @override
  String toString() {
    return 'InitEntity(hostname: $hostname, password: $password, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitEntityImpl &&
            (identical(other.hostname, hostname) ||
                other.hostname == hostname) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hostname, password, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitEntityImplCopyWith<_$InitEntityImpl> get copyWith =>
      __$$InitEntityImplCopyWithImpl<_$InitEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InitEntityImplToJson(
      this,
    );
  }
}

abstract class _InitEntity implements InitEntity {
  const factory _InitEntity(
          {@JsonKey(name: "hostname") required final String hostname,
          @JsonKey(name: "password") required final String password,
          @JsonKey(name: "username") required final String username}) =
      _$InitEntityImpl;

  factory _InitEntity.fromJson(Map<String, dynamic> json) =
      _$InitEntityImpl.fromJson;

  @override
  @JsonKey(name: "hostname")
  String get hostname;
  @override
  @JsonKey(name: "password")
  String get password;
  @override
  @JsonKey(name: "username")
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$InitEntityImplCopyWith<_$InitEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
