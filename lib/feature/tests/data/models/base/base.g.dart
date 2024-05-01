// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommonInterfaceImpl _$$CommonInterfaceImplFromJson(
        Map<String, dynamic> json) =>
    _$CommonInterfaceImpl(
      apPort: (json['apPort'] as List<dynamic>)
          .map((e) => ApPort.fromJson(e as Map<String, dynamic>))
          .toList(),
      basePort: (json['basePort'] as List<dynamic>)
          .map((e) => BasePort.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommonInterfaceImplToJson(
        _$CommonInterfaceImpl instance) =>
    <String, dynamic>{
      'apPort': instance.apPort,
      'basePort': instance.basePort,
    };

_$ApPortImpl _$$ApPortImplFromJson(Map<String, dynamic> json) => _$ApPortImpl(
      pvid: json['PVID'] as String,
      allowVid: json['allowVID'] as String,
      commonPort:
          CommonPort.fromJson(json['commonPort'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApPortImplToJson(_$ApPortImpl instance) =>
    <String, dynamic>{
      'PVID': instance.pvid,
      'allowVID': instance.allowVid,
      'commonPort': instance.commonPort,
    };

_$CommonPortImpl _$$CommonPortImplFromJson(Map<String, dynamic> json) =>
    _$CommonPortImpl(
      portRange: json['portRange'] as String,
      portType: json['portType'] as String,
    );

Map<String, dynamic> _$$CommonPortImplToJson(_$CommonPortImpl instance) =>
    <String, dynamic>{
      'portRange': instance.portRange,
      'portType': instance.portType,
    };

_$BasePortImpl _$$BasePortImplFromJson(Map<String, dynamic> json) =>
    _$BasePortImpl(
      commonPort:
          CommonPort.fromJson(json['commonPort'] as Map<String, dynamic>),
      portVlanId: json['portVlanID'] as String,
    );

Map<String, dynamic> _$$BasePortImplToJson(_$BasePortImpl instance) =>
    <String, dynamic>{
      'commonPort': instance.commonPort,
      'portVlanID': instance.portVlanId,
    };
