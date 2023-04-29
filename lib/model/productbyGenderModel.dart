// To parse this JSON data, do
//
//     final productByGenderModel = productByGenderModelFromJson(jsonString);

import 'dart:convert';

ProductByGenderModel productByGenderModelFromJson(String str) =>
    ProductByGenderModel.fromJson(json.decode(str));

String productByGenderModelToJson(ProductByGenderModel data) =>
    json.encode(data.toJson());

class ProductByGenderModel {
  ProductByGenderModel({
    required this.id,
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

  final int id;
  final String? name;
  final String? slug;
  final String? mrp;
  final String? price;
  final String? availability;
  final String? extraPrice;
  final String? productName;
  final String? categoriesName;
  final List<String>? images;
  final bool? wishlist;

  factory ProductByGenderModel.fromJson(Map<String, dynamic> json) =>
      ProductByGenderModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        mrp: json["mrp"],
        price: json["price"],
        availability: json["availability"],
        extraPrice: json["extra_price"],
        productName: json["product_name"],
        categoriesName: json["categories_name"],
        images: List<String>.from(json["images"].map((x) => x)),
        wishlist: json["wishlist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
