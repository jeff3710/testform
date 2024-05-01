// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseDataModelImpl _$$ResponseDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseDataModelImpl(
      errorCode: json['error_code'] as int,
      data: json['data'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ResponseDataModelImplToJson(
        _$ResponseDataModelImpl instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'data': instance.data,
      'message': instance.message,
    };
