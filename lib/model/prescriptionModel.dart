// To parse this JSON data, do
//
//     final prescriptionModel = prescriptionModelFromJson(jsonString);

import 'dart:convert';

PrescriptionModel prescriptionModelFromJson(String str) =>
    PrescriptionModel.fromJson(json.decode(str));

String prescriptionModelToJson(PrescriptionModel data) =>
    json.encode(data.toJson());

class PrescriptionModel {
  final String prescription;

  PrescriptionModel({
    required this.prescription,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionModel(
        prescription: json["prescription"],
      );

  Map<String, dynamic> toJson() => {
        "prescription": prescription,
      };
}
