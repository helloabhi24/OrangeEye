// To parse this JSON data, do
//
//     final differentTypeCategoryModel = differentTypeCategoryModelFromJson(jsonString);

import 'dart:convert';

DifferentTypeCategoryModel differentTypeCategoryModelFromJson(String str) =>
    DifferentTypeCategoryModel.fromJson(json.decode(str));

String differentTypeCategoryModelToJson(DifferentTypeCategoryModel data) =>
    json.encode(data.toJson());

class DifferentTypeCategoryModel {
  DifferentTypeCategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  final int id;
  final String name;
  final String image;

  factory DifferentTypeCategoryModel.fromJson(Map<String, dynamic> json) =>
      DifferentTypeCategoryModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
