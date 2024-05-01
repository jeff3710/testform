// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseConfigModel _$BaseConfigModelFromJson(Map<String, dynamic> json) {
  return _BaseConfigModel.fromJson(json);
}

/// @nodoc
mixin _$BaseConfigModel {
  @JsonKey(name: "error_code")
  int get errorCode => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  String get data => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseConfigModelCopyWith<BaseConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseConfigModelCopyWith<$Res> {
  factory $BaseConfigModelCopyWith(
          BaseConfigModel value, $Res Function(BaseConfigModel) then) =
      _$BaseConfigModelCopyWithImpl<$Res, BaseConfigModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "error_code") int errorCode,
      @JsonKey(name: "data") String data,
      @JsonKey(name: "message") String message});
}

/// @nodoc
class _$BaseConfigModelCopyWithImpl<$Res, $Val extends BaseConfigModel>
    implements $BaseConfigModelCopyWith<$Res> {
  _$BaseConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorCode = null,
    Object? data = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseConfigModelImplCopyWith<$Res>
    implements $BaseConfigModelCopyWith<$Res> {
  factory _$$BaseConfigModelImplCopyWith(_$BaseConfigModelImpl value,
          $Res Function(_$BaseConfigModelImpl) then) =
      __$$BaseConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "error_code") int errorCode,
      @JsonKey(name: "data") String data,
      @JsonKey(name: "message") String message});
}

/// @nodoc
class __$$BaseConfigModelImplCopyWithImpl<$Res>
    extends _$BaseConfigModelCopyWithImpl<$Res, _$BaseConfigModelImpl>
    implements _$$BaseConfigModelImplCopyWith<$Res> {
  __$$BaseConfigModelImplCopyWithImpl(
      _$BaseConfigModelImpl _value, $Res Function(_$BaseConfigModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorCode = null,
    Object? data = null,
    Object? message = null,
  }) {
    return _then(_$BaseConfigModelImpl(
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseConfigModelImpl implements _BaseConfigModel {
  const _$BaseConfigModelImpl(
      {@JsonKey(name: "error_code") required this.errorCode,
      @JsonKey(name: "data") required this.data,
      @JsonKey(name: "message") required this.message});

  factory _$BaseConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseConfigModelImplFromJson(json);

  @override
  @JsonKey(name: "error_code")
  final int errorCode;
  @override
  @JsonKey(name: "data")
  final String data;
  @override
  @JsonKey(name: "message")
  final String message;

  @override
  String toString() {
    return 'BaseConfigModel(errorCode: $errorCode, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseConfigModelImpl &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, errorCode, data, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseConfigModelImplCopyWith<_$BaseConfigModelImpl> get copyWith =>
      __$$BaseConfigModelImplCopyWithImpl<_$BaseConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseConfigModelImplToJson(
      this,
    );
  }
}

abstract class _BaseConfigModel implements BaseConfigModel {
  const factory _BaseConfigModel(
          {@JsonKey(name: "error_code") required final int errorCode,
          @JsonKey(name: "data") required final String data,
          @JsonKey(name: "message") required final String message}) =
      _$BaseConfigModelImpl;

  factory _BaseConfigModel.fromJson(Map<String, dynamic> json) =
      _$BaseConfigModelImpl.fromJson;

  @override
  @JsonKey(name: "error_code")
  int get errorCode;
  @override
  @JsonKey(name: "data")
  String get data;
  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$BaseConfigModelImplCopyWith<_$BaseConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
