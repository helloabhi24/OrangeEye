// To parse this JSON data, do
//
//     final getLensesByCategoryModel = getLensesByCategoryModelFromJson(jsonString);

import 'dart:convert';

GetLensesByCategoryModel getLensesByCategoryModelFromJson(String str) =>
    GetLensesByCategoryModel.fromJson(json.decode(str));

String getLensesByCategoryModelToJson(GetLensesByCategoryModel data) =>
    json.encode(data.toJson());

class GetLensesByCategoryModel {
  final int id;
  final String? name;
  final String? image;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Lense>? lenses;

  GetLensesByCategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.lenses,
  });

  factory GetLensesByCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetLensesByCategoryModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lenses: List<Lense>.from(json["lenses"].map((x) => Lense.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "lenses": List<dynamic>.from(lenses!.map((x) => x.toJson())),
      };
}

class Lense {
  final int id;
  final String? lensCategory;
  final String? name;
  final String? mrp;
  final String? price;
  final String? cgst;
  final String? sgst;
  final String? igst;
  final String? image;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Lense({
    required this.id,
    required this.lensCategory,
    required this.name,
    required this.mrp,
    required this.price,
    required this.cgst,
    required this.sgst,
    required this.igst,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lense.fromJson(Map<String, dynamic> json) => Lense(
        id: json["id"],
        lensCategory: json["lens_category"],
        name: json["name"],
        mrp: json["mrp"],
        price: json["price"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        igst: json["igst"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lens_category": lensCategory,
        "name": name,
        "mrp": mrp,
        "price": price,
        "cgst": cgst,
        "sgst": sgst,
        "igst": igst,
        "image": image,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
