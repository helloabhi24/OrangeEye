// To parse this JSON data, do
//
//     final genderWiseProductModel = genderWiseProductModelFromJson(jsonString);

import 'dart:convert';

GenderWiseProductModel genderWiseProductModelFromJson(String str) =>
    GenderWiseProductModel.fromJson(json.decode(str));

String genderWiseProductModelToJson(GenderWiseProductModel data) =>
    json.encode(data.toJson());

class GenderWiseProductModel {
  final int id;
  final String? isBestSeller;
  final String? colorName;
  final String? colorCode;
  final String? name;
  final String? slug;
  final dynamic mrp;
  final dynamic price;
  final String? availability;
  final String? extraPrice;
  final String? productName;
  final String? categoriesName;
  final List<String>? images;
  final bool? wishlist;

  GenderWiseProductModel({
    required this.id,
    required this.isBestSeller,
    this.colorName,
    this.colorCode,
    required this.name,
    required this.slug,
    required this.mrp,
    required this.price,
    required this.availability,
    required this.extraPrice,
    required this.productName,
    required this.categoriesName,
    required this.images,
    required this.wishlist,
  });

  factory GenderWiseProductModel.fromJson(Map<String, dynamic> json) =>
      GenderWiseProductModel(
        id: json["id"],
        isBestSeller: json["is_best_seller"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
        name: json["name"],
        slug: json["slug"],
        mrp: json["mrp"],
        price: json["price"],
        availability: json["availability"],
        extraPrice: json["extra_price"] ?? "",
        productName: json["product_name"],
        categoriesName: json["categories_name"],
        images: List<String>.from(json["images"].map((x) => x)),
        wishlist: json["wishlist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_best_seller": isBestSeller,
        "color_name": colorName,
        "color_code": colorCode,
        "name": name,
        "slug": slug,
        "mrp": mrp,
        "price": price,
        "availability": availability,
        "extra_price": extraPrice,
        "product_name": productName,
        "categories_name": categoriesName,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "wishlist": wishlist,
      };
}
