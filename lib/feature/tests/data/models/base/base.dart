// To parse this JSON data, do
//
//     final commonInterface = commonInterfaceFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'base.freezed.dart';
part 'base.g.dart';

CommonInterface commonInterfaceFromJson(String str) =>
    CommonInterface.fromJson(json.decode(str));

String commonInterfaceToJson(CommonInterface data) =>
    json.encode(data.toJson());

@freezed
class CommonInterface with _$CommonInterface {
  const factory CommonInterface({
    @JsonKey(name: "apPort") required List<ApPort> apPort,
    @JsonKey(name: "basePort") required List<BasePort> basePort,
  }) = _CommonInterface;

  factory CommonInterface.fromJson(Map<String, dynamic> json) =>
      _$CommonInterfaceFromJson(json);
}

@freezed
class ApPort with _$ApPort {
  const factory ApPort({
    @JsonKey(name: "PVID") required String pvid,
    @JsonKey(name: "allowVID") required String allowVid,
    @JsonKey(name: "commonPort") required CommonPort commonPort,
  }) = _ApPort;

  factory ApPort.fromJson(Map<String, dynamic> json) => _$ApPortFromJson(json);
}

@freezed
class CommonPort with _$CommonPort {
  const factory CommonPort({
    @JsonKey(name: "portRange") required String portRange,
    @JsonKey(name: "portType") required String portType,
  }) = _CommonPort;

  factory CommonPort.fromJson(Map<String, dynamic> json) =>
      _$CommonPortFromJson(json);
}

@freezed
class BasePort with _$BasePort {
  const factory BasePort({
    @JsonKey(name: "commonPort") required CommonPort commonPort,
    @JsonKey(name: "portVlanID") required String portVlanId,
  }) = _BasePort;

  factory BasePort.fromJson(Map<String, dynamic> json) =>
      _$BasePortFromJson(json);
}
