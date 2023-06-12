// To parse this JSON data, do
//
//     final getCategoryNameModel = getCategoryNameModelFromJson(jsonString);

import 'dart:convert';

GetCategoryNameModel getCategoryNameModelFromJson(String str) =>
    GetCategoryNameModel.fromJson(json.decode(str));

String getCategoryNameModelToJson(GetCategoryNameModel data) =>
    json.encode(data.toJson());

class GetCategoryNameModel {
  final int id;
  final String image;
  final String name;
  final String status;

  GetCategoryNameModel({
    required this.id,
    required this.image,
    required this.name,
    required this.status,
  });

  factory GetCategoryNameModel.fromJson(Map<String, dynamic> json) =>
      GetCategoryNameModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "status": status,
      };
}
