// To parse this JSON data, do
//
//     final initEntity = initEntityFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'init_entity.freezed.dart';
part 'init_entity.g.dart';

InitEntity initEntityFromJson(String str) =>
    InitEntity.fromJson(json.decode(str));

String initEntityToJson(InitEntity data) => json.encode(data.toJson());

@freezed
class InitEntity with _$InitEntity {
  const factory InitEntity({
    @JsonKey(name: "hostname") required String hostname,
    @JsonKey(name: "password") required String password,
    @JsonKey(name: "username") required String username,
  }) = _InitEntity;

  factory InitEntity.fromJson(Map<String, dynamic> json) =>
      _$InitEntityFromJson(json);
}
