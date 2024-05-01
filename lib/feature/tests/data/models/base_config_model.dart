// To parse this JSON data, do
//
//     final baseConfigModel = baseConfigModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'base_config_model.freezed.dart';
part 'base_config_model.g.dart';

BaseConfigModel baseConfigModelFromJson(String str) =>
    BaseConfigModel.fromJson(json.decode(str));

String baseConfigModelToJson(BaseConfigModel data) =>
    json.encode(data.toJson());

@freezed
class BaseConfigModel with _$BaseConfigModel {
  const factory BaseConfigModel({
    @JsonKey(name: "error_code") required int errorCode,
    @JsonKey(name: "data") required String data,
    @JsonKey(name: "message") required String message,
  }) = _BaseConfigModel;

  factory BaseConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BaseConfigModelFromJson(json);
}
