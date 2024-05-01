// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseDataModel _$ResponseDataModelFromJson(Map<String, dynamic> json) {
  return _ResponseDataModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseDataModel {
  @JsonKey(name: "error_code")
  int get errorCode => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  String get data => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseDataModelCopyWith<ResponseDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseDataModelCopyWith<$Res> {
  factory $ResponseDataModelCopyWith(
          ResponseDataModel value, $Res Function(ResponseDataModel) then) =
      _$ResponseDataModelCopyWithImpl<$Res, ResponseDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "error_code") int errorCode,
      @JsonKey(name: "data") String data,
      @JsonKey(name: "message") String message});
}

/// @nodoc
class _$ResponseDataModelCopyWithImpl<$Res, $Val extends ResponseDataModel>
    implements $ResponseDataModelCopyWith<$Res> {
  _$ResponseDataModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ResponseDataModelImplCopyWith<$Res>
    implements $ResponseDataModelCopyWith<$Res> {
  factory _$$ResponseDataModelImplCopyWith(_$ResponseDataModelImpl value,
          $Res Function(_$ResponseDataModelImpl) then) =
      __$$ResponseDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "error_code") int errorCode,
      @JsonKey(name: "data") String data,
      @JsonKey(name: "message") String message});
}

/// @nodoc
class __$$ResponseDataModelImplCopyWithImpl<$Res>
    extends _$ResponseDataModelCopyWithImpl<$Res, _$ResponseDataModelImpl>
    implements _$$ResponseDataModelImplCopyWith<$Res> {
  __$$ResponseDataModelImplCopyWithImpl(_$ResponseDataModelImpl _value,
      $Res Function(_$ResponseDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorCode = null,
    Object? data = null,
    Object? message = null,
  }) {
    return _then(_$ResponseDataModelImpl(
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
class _$ResponseDataModelImpl implements _ResponseDataModel {
  const _$ResponseDataModelImpl(
      {@JsonKey(name: "error_code") required this.errorCode,
      @JsonKey(name: "data") required this.data,
      @JsonKey(name: "message") required this.message});

  factory _$ResponseDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseDataModelImplFromJson(json);

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
    return 'ResponseDataModel(errorCode: $errorCode, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseDataModelImpl &&
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
  _$$ResponseDataModelImplCopyWith<_$ResponseDataModelImpl> get copyWith =>
      __$$ResponseDataModelImplCopyWithImpl<_$ResponseDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseDataModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseDataModel implements ResponseDataModel {
  const factory _ResponseDataModel(
          {@JsonKey(name: "error_code") required final int errorCode,
          @JsonKey(name: "data") required final String data,
          @JsonKey(name: "message") required final String message}) =
      _$ResponseDataModelImpl;

  factory _ResponseDataModel.fromJson(Map<String, dynamic> json) =
      _$ResponseDataModelImpl.fromJson;

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
  _$$ResponseDataModelImplCopyWith<_$ResponseDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
