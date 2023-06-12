// To parse this JSON data, do
//
//     final glassesModel = glassesModelFromJson(jsonString);

import 'dart:convert';

GlassesModel glassesModelFromJson(String str) =>
    GlassesModel.fromJson(json.decode(str));

String glassesModelToJson(GlassesModel data) => json.encode(data.toJson());

class GlassesModel {
  final int id;
  final String name;

  GlassesModel({
    required this.id,
    required this.name,
  });

  factory GlassesModel.fromJson(Map<String, dynamic> json) => GlassesModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
