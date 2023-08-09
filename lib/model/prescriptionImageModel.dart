// To parse this JSON data, do
//
//     final prescriptionModel = prescriptionModelFromJson(jsonString);

import 'dart:convert';

PrescriptionImageModel prescriptionModelFromJson(String str) =>
    PrescriptionImageModel.fromJson(json.decode(str));

String prescriptionModelToJson(PrescriptionImageModel data) =>
    json.encode(data.toJson());

class PrescriptionImageModel {
  final List<String> prescription;

  PrescriptionImageModel({
    required this.prescription,
  });

  factory PrescriptionImageModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionImageModel(
        prescription: List<String>.from(json["prescription"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "prescription": List<dynamic>.from(prescription.map((x) => x)),
      };
}
