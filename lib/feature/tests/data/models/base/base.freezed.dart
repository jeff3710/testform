// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommonInterface _$CommonInterfaceFromJson(Map<String, dynamic> json) {
  return _CommonInterface.fromJson(json);
}

/// @nodoc
mixin _$CommonInterface {
  @JsonKey(name: "apPort")
  List<ApPort> get apPort => throw _privateConstructorUsedError;
  @JsonKey(name: "basePort")
  List<BasePort> get basePort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonInterfaceCopyWith<CommonInterface> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonInterfaceCopyWith<$Res> {
  factory $CommonInterfaceCopyWith(
          CommonInterface value, $Res Function(CommonInterface) then) =
      _$CommonInterfaceCopyWithImpl<$Res, CommonInterface>;
  @useResult
  $Res call(
      {@JsonKey(name: "apPort") List<ApPort> apPort,
      @JsonKey(name: "basePort") List<BasePort> basePort});
}

/// @nodoc
class _$CommonInterfaceCopyWithImpl<$Res, $Val extends CommonInterface>
    implements $CommonInterfaceCopyWith<$Res> {
  _$CommonInterfaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apPort = null,
    Object? basePort = null,
  }) {
    return _then(_value.copyWith(
      apPort: null == apPort
          ? _value.apPort
          : apPort // ignore: cast_nullable_to_non_nullable
              as List<ApPort>,
      basePort: null == basePort
          ? _value.basePort
          : basePort // ignore: cast_nullable_to_non_nullable
              as List<BasePort>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonInterfaceImplCopyWith<$Res>
    implements $CommonInterfaceCopyWith<$Res> {
  factory _$$CommonInterfaceImplCopyWith(_$CommonInterfaceImpl value,
          $Res Function(_$CommonInterfaceImpl) then) =
      __$$CommonInterfaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "apPort") List<ApPort> apPort,
      @JsonKey(name: "basePort") List<BasePort> basePort});
}

/// @nodoc
class __$$CommonInterfaceImplCopyWithImpl<$Res>
    extends _$CommonInterfaceCopyWithImpl<$Res, _$CommonInterfaceImpl>
    implements _$$CommonInterfaceImplCopyWith<$Res> {
  __$$CommonInterfaceImplCopyWithImpl(
      _$CommonInterfaceImpl _value, $Res Function(_$CommonInterfaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apPort = null,
    Object? basePort = null,
  }) {
    return _then(_$CommonInterfaceImpl(
      apPort: null == apPort
          ? _value._apPort
          : apPort // ignore: cast_nullable_to_non_nullable
              as List<ApPort>,
      basePort: null == basePort
          ? _value._basePort
          : basePort // ignore: cast_nullable_to_non_nullable
              as List<BasePort>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonInterfaceImpl implements _CommonInterface {
  const _$CommonInterfaceImpl(
      {@JsonKey(name: "apPort") required final List<ApPort> apPort,
      @JsonKey(name: "basePort") required final List<BasePort> basePort})
      : _apPort = apPort,
        _basePort = basePort;

  factory _$CommonInterfaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonInterfaceImplFromJson(json);

  final List<ApPort> _apPort;
  @override
  @JsonKey(name: "apPort")
  List<ApPort> get apPort {
    if (_apPort is EqualUnmodifiableListView) return _apPort;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apPort);
  }

  final List<BasePort> _basePort;
  @override
  @JsonKey(name: "basePort")
  List<BasePort> get basePort {
    if (_basePort is EqualUnmodifiableListView) return _basePort;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basePort);
  }

  @override
  String toString() {
    return 'CommonInterface(apPort: $apPort, basePort: $basePort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonInterfaceImpl &&
            const DeepCollectionEquality().equals(other._apPort, _apPort) &&
            const DeepCollectionEquality().equals(other._basePort, _basePort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_apPort),
      const DeepCollectionEquality().hash(_basePort));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonInterfaceImplCopyWith<_$CommonInterfaceImpl> get copyWith =>
      __$$CommonInterfaceImplCopyWithImpl<_$CommonInterfaceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonInterfaceImplToJson(
      this,
    );
  }
}

abstract class _CommonInterface implements CommonInterface {
  const factory _CommonInterface(
          {@JsonKey(name: "apPort") required final List<ApPort> apPort,
          @JsonKey(name: "basePort") required final List<BasePort> basePort}) =
      _$CommonInterfaceImpl;

  factory _CommonInterface.fromJson(Map<String, dynamic> json) =
      _$CommonInterfaceImpl.fromJson;

  @override
  @JsonKey(name: "apPort")
  List<ApPort> get apPort;
  @override
  @JsonKey(name: "basePort")
  List<BasePort> get basePort;
  @override
  @JsonKey(ignore: true)
  _$$CommonInterfaceImplCopyWith<_$CommonInterfaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApPort _$ApPortFromJson(Map<String, dynamic> json) {
  return _ApPort.fromJson(json);
}

/// @nodoc
mixin _$ApPort {
  @JsonKey(name: "PVID")
  String get pvid => throw _privateConstructorUsedError;
  @JsonKey(name: "allowVID")
  String get allowVid => throw _privateConstructorUsedError;
  @JsonKey(name: "commonPort")
  CommonPort get commonPort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApPortCopyWith<ApPort> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApPortCopyWith<$Res> {
  factory $ApPortCopyWith(ApPort value, $Res Function(ApPort) then) =
      _$ApPortCopyWithImpl<$Res, ApPort>;
  @useResult
  $Res call(
      {@JsonKey(name: "PVID") String pvid,
      @JsonKey(name: "allowVID") String allowVid,
      @JsonKey(name: "commonPort") CommonPort commonPort});

  $CommonPortCopyWith<$Res> get commonPort;
}

/// @nodoc
class _$ApPortCopyWithImpl<$Res, $Val extends ApPort>
    implements $ApPortCopyWith<$Res> {
  _$ApPortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pvid = null,
    Object? allowVid = null,
    Object? commonPort = null,
  }) {
    return _then(_value.copyWith(
      pvid: null == pvid
          ? _value.pvid
          : pvid // ignore: cast_nullable_to_non_nullable
              as String,
      allowVid: null == allowVid
          ? _value.allowVid
          : allowVid // ignore: cast_nullable_to_non_nullable
              as String,
      commonPort: null == commonPort
          ? _value.commonPort
          : commonPort // ignore: cast_nullable_to_non_nullable
              as CommonPort,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommonPortCopyWith<$Res> get commonPort {
    return $CommonPortCopyWith<$Res>(_value.commonPort, (value) {
      return _then(_value.copyWith(commonPort: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApPortImplCopyWith<$Res> implements $ApPortCopyWith<$Res> {
  factory _$$ApPortImplCopyWith(
          _$ApPortImpl value, $Res Function(_$ApPortImpl) then) =
      __$$ApPortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "PVID") String pvid,
      @JsonKey(name: "allowVID") String allowVid,
      @JsonKey(name: "commonPort") CommonPort commonPort});

  @override
  $CommonPortCopyWith<$Res> get commonPort;
}

/// @nodoc
class __$$ApPortImplCopyWithImpl<$Res>
    extends _$ApPortCopyWithImpl<$Res, _$ApPortImpl>
    implements _$$ApPortImplCopyWith<$Res> {
  __$$ApPortImplCopyWithImpl(
      _$ApPortImpl _value, $Res Function(_$ApPortImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pvid = null,
    Object? allowVid = null,
    Object? commonPort = null,
  }) {
    return _then(_$ApPortImpl(
      pvid: null == pvid
          ? _value.pvid
          : pvid // ignore: cast_nullable_to_non_nullable
              as String,
      allowVid: null == allowVid
          ? _value.allowVid
          : allowVid // ignore: cast_nullable_to_non_nullable
              as String,
      commonPort: null == commonPort
          ? _value.commonPort
          : commonPort // ignore: cast_nullable_to_non_nullable
              as CommonPort,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApPortImpl implements _ApPort {
  const _$ApPortImpl(
      {@JsonKey(name: "PVID") required this.pvid,
      @JsonKey(name: "allowVID") required this.allowVid,
      @JsonKey(name: "commonPort") required this.commonPort});

  factory _$ApPortImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApPortImplFromJson(json);

  @override
  @JsonKey(name: "PVID")
  final String pvid;
  @override
  @JsonKey(name: "allowVID")
  final String allowVid;
  @override
  @JsonKey(name: "commonPort")
  final CommonPort commonPort;

  @override
  String toString() {
    return 'ApPort(pvid: $pvid, allowVid: $allowVid, commonPort: $commonPort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApPortImpl &&
            (identical(other.pvid, pvid) || other.pvid == pvid) &&
            (identical(other.allowVid, allowVid) ||
                other.allowVid == allowVid) &&
            (identical(other.commonPort, commonPort) ||
                other.commonPort == commonPort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pvid, allowVid, commonPort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApPortImplCopyWith<_$ApPortImpl> get copyWith =>
      __$$ApPortImplCopyWithImpl<_$ApPortImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApPortImplToJson(
      this,
    );
  }
}

abstract class _ApPort implements ApPort {
  const factory _ApPort(
          {@JsonKey(name: "PVID") required final String pvid,
          @JsonKey(name: "allowVID") required final String allowVid,
          @JsonKey(name: "commonPort") required final CommonPort commonPort}) =
      _$ApPortImpl;

  factory _ApPort.fromJson(Map<String, dynamic> json) = _$ApPortImpl.fromJson;

  @override
  @JsonKey(name: "PVID")
  String get pvid;
  @override
  @JsonKey(name: "allowVID")
  String get allowVid;
  @override
  @JsonKey(name: "commonPort")
  CommonPort get commonPort;
  @override
  @JsonKey(ignore: true)
  _$$ApPortImplCopyWith<_$ApPortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommonPort _$CommonPortFromJson(Map<String, dynamic> json) {
  return _CommonPort.fromJson(json);
}

/// @nodoc
mixin _$CommonPort {
  @JsonKey(name: "portRange")
  String get portRange => throw _privateConstructorUsedError;
  @JsonKey(name: "portType")
  String get portType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonPortCopyWith<CommonPort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonPortCopyWith<$Res> {
  factory $CommonPortCopyWith(
          CommonPort value, $Res Function(CommonPort) then) =
      _$CommonPortCopyWithImpl<$Res, CommonPort>;
  @useResult
  $Res call(
      {@JsonKey(name: "portRange") String portRange,
      @JsonKey(name: "portType") String portType});
}

/// @nodoc
class _$CommonPortCopyWithImpl<$Res, $Val extends CommonPort>
    implements $CommonPortCopyWith<$Res> {
  _$CommonPortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? portRange = null,
    Object? portType = null,
  }) {
    return _then(_value.copyWith(
      portRange: null == portRange
          ? _value.portRange
          : portRange // ignore: cast_nullable_to_non_nullable
              as String,
      portType: null == portType
          ? _value.portType
          : portType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonPortImplCopyWith<$Res>
    implements $CommonPortCopyWith<$Res> {
  factory _$$CommonPortImplCopyWith(
          _$CommonPortImpl value, $Res Function(_$CommonPortImpl) then) =
      __$$CommonPortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "portRange") String portRange,
      @JsonKey(name: "portType") String portType});
}

/// @nodoc
class __$$CommonPortImplCopyWithImpl<$Res>
    extends _$CommonPortCopyWithImpl<$Res, _$CommonPortImpl>
    implements _$$CommonPortImplCopyWith<$Res> {
  __$$CommonPortImplCopyWithImpl(
      _$CommonPortImpl _value, $Res Function(_$CommonPortImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? portRange = null,
    Object? portType = null,
  }) {
    return _then(_$CommonPortImpl(
      portRange: null == portRange
          ? _value.portRange
          : portRange // ignore: cast_nullable_to_non_nullable
              as String,
      portType: null == portType
          ? _value.portType
          : portType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonPortImpl implements _CommonPort {
  const _$CommonPortImpl(
      {@JsonKey(name: "portRange") required this.portRange,
      @JsonKey(name: "portType") required this.portType});

  factory _$CommonPortImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonPortImplFromJson(json);

  @override
  @JsonKey(name: "portRange")
  final String portRange;
  @override
  @JsonKey(name: "portType")
  final String portType;

  @override
  String toString() {
    return 'CommonPort(portRange: $portRange, portType: $portType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonPortImpl &&
            (identical(other.portRange, portRange) ||
                other.portRange == portRange) &&
            (identical(other.portType, portType) ||
                other.portType == portType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, portRange, portType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonPortImplCopyWith<_$CommonPortImpl> get copyWith =>
      __$$CommonPortImplCopyWithImpl<_$CommonPortImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonPortImplToJson(
      this,
    );
  }
}

abstract class _CommonPort implements CommonPort {
  const factory _CommonPort(
          {@JsonKey(name: "portRange") required final String portRange,
          @JsonKey(name: "portType") required final String portType}) =
      _$CommonPortImpl;

  factory _CommonPort.fromJson(Map<String, dynamic> json) =
      _$CommonPortImpl.fromJson;

  @override
  @JsonKey(name: "portRange")
  String get portRange;
  @override
  @JsonKey(name: "portType")
  String get portType;
  @override
  @JsonKey(ignore: true)
  _$$CommonPortImplCopyWith<_$CommonPortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BasePort _$BasePortFromJson(Map<String, dynamic> json) {
  return _BasePort.fromJson(json);
}

/// @nodoc
mixin _$BasePort {
  @JsonKey(name: "commonPort")
  CommonPort get commonPort => throw _privateConstructorUsedError;
  @JsonKey(name: "portVlanID")
  String get portVlanId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasePortCopyWith<BasePort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasePortCopyWith<$Res> {
  factory $BasePortCopyWith(BasePort value, $Res Function(BasePort) then) =
      _$BasePortCopyWithImpl<$Res, BasePort>;
  @useResult
  $Res call(
      {@JsonKey(name: "commonPort") CommonPort commonPort,
      @JsonKey(name: "portVlanID") String portVlanId});

  $CommonPortCopyWith<$Res> get commonPort;
}

/// @nodoc
class _$BasePortCopyWithImpl<$Res, $Val extends BasePort>
    implements $BasePortCopyWith<$Res> {
  _$BasePortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonPort = null,
    Object? portVlanId = null,
  }) {
    return _then(_value.copyWith(
      commonPort: null == commonPort
          ? _value.commonPort
          : commonPort // ignore: cast_nullable_to_non_nullable
              as CommonPort,
      portVlanId: null == portVlanId
          ? _value.portVlanId
          : portVlanId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommonPortCopyWith<$Res> get commonPort {
    return $CommonPortCopyWith<$Res>(_value.commonPort, (value) {
      return _then(_value.copyWith(commonPort: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BasePortImplCopyWith<$Res>
    implements $BasePortCopyWith<$Res> {
  factory _$$BasePortImplCopyWith(
          _$BasePortImpl value, $Res Function(_$BasePortImpl) then) =
      __$$BasePortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "commonPort") CommonPort commonPort,
      @JsonKey(name: "portVlanID") String portVlanId});

  @override
  $CommonPortCopyWith<$Res> get commonPort;
}

/// @nodoc
class __$$BasePortImplCopyWithImpl<$Res>
    extends _$BasePortCopyWithImpl<$Res, _$BasePortImpl>
    implements _$$BasePortImplCopyWith<$Res> {
  __$$BasePortImplCopyWithImpl(
      _$BasePortImpl _value, $Res Function(_$BasePortImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonPort = null,
    Object? portVlanId = null,
  }) {
    return _then(_$BasePortImpl(
      commonPort: null == commonPort
          ? _value.commonPort
          : commonPort // ignore: cast_nullable_to_non_nullable
              as CommonPort,
      portVlanId: null == portVlanId
          ? _value.portVlanId
          : portVlanId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasePortImpl implements _BasePort {
  const _$BasePortImpl(
      {@JsonKey(name: "commonPort") required this.commonPort,
      @JsonKey(name: "portVlanID") required this.portVlanId});

  factory _$BasePortImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasePortImplFromJson(json);

  @override
  @JsonKey(name: "commonPort")
  final CommonPort commonPort;
  @override
  @JsonKey(name: "portVlanID")
  final String portVlanId;

  @override
  String toString() {
    return 'BasePort(commonPort: $commonPort, portVlanId: $portVlanId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasePortImpl &&
            (identical(other.commonPort, commonPort) ||
                other.commonPort == commonPort) &&
            (identical(other.portVlanId, portVlanId) ||
                other.portVlanId == portVlanId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, commonPort, portVlanId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasePortImplCopyWith<_$BasePortImpl> get copyWith =>
      __$$BasePortImplCopyWithImpl<_$BasePortImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasePortImplToJson(
      this,
    );
  }
}

abstract class _BasePort implements BasePort {
  const factory _BasePort(
          {@JsonKey(name: "commonPort") required final CommonPort commonPort,
          @JsonKey(name: "portVlanID") required final String portVlanId}) =
      _$BasePortImpl;

  factory _BasePort.fromJson(Map<String, dynamic> json) =
      _$BasePortImpl.fromJson;

  @override
  @JsonKey(name: "commonPort")
  CommonPort get commonPort;
  @override
  @JsonKey(name: "portVlanID")
  String get portVlanId;
  @override
  @JsonKey(ignore: true)
  _$$BasePortImplCopyWith<_$BasePortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
