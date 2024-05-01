// To parse this JSON data, do
//
//     final responseDataModel = responseDataModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'response_data_model.freezed.dart';
part 'response_data_model.g.dart';

ResponseDataModel responseDataModelFromJson(String str) =>
    ResponseDataModel.fromJson(json.decode(str));

String responseDataModelToJson(ResponseDataModel data) =>
    json.encode(data.toJson());

@freezed
class ResponseDataModel with _$ResponseDataModel {
  const factory ResponseDataModel({
    @JsonKey(name: "error_code") required int errorCode,
    @JsonKey(name: "data") required String data,
    @JsonKey(name: "message") required String message,
  }) = _ResponseDataModel;

  factory ResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataModelFromJson(json);
}
