// To parse this JSON data, do
//
//     final coupounsModel = coupounsModelFromJson(jsonString);

import 'dart:convert';

CoupounsModel coupounsModelFromJson(String str) =>
    CoupounsModel.fromJson(json.decode(str));

String coupounsModelToJson(CoupounsModel data) => json.encode(data.toJson());

class CoupounsModel {
  final int id;
  final String title;
  final String code;
  final String value;
  final String minOrderAmt;
  final String type;
  final String isOneTime;

  CoupounsModel({
    required this.id,
    required this.title,
    required this.code,
    required this.value,
    required this.minOrderAmt,
    required this.type,
    required this.isOneTime,
  });

  factory CoupounsModel.fromJson(Map<String, dynamic> json) => CoupounsModel(
        id: json["id"],
        title: json["title"],
        code: json["code"],
        value: json["value"],
        minOrderAmt: json["min_order_amt"],
        type: json["type"],
        isOneTime: json["is_one_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "code": code,
        "value": value,
        "min_order_amt": minOrderAmt,
        "type": type,
        "is_one_time": isOneTime,
      };
}
