// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseConfigModelImpl _$$BaseConfigModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseConfigModelImpl(
      errorCode: json['error_code'] as int,
      data: json['data'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$BaseConfigModelImplToJson(
        _$BaseConfigModelImpl instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'data': instance.data,
      'message': instance.message,
    };
