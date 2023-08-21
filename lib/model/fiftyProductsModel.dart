// To parse this JSON data, do
//
//     final fiftyProductModel = fiftyProductModelFromJson(jsonString);

import 'dart:convert';

FiftyProductModel fiftyProductModelFromJson(String str) =>
    FiftyProductModel.fromJson(json.decode(str));

String fiftyProductModelToJson(FiftyProductModel data) =>
    json.encode(data.toJson());

class FiftyProductModel {
  final int id;
  final String frameWidth;
  final String lenseWidth;
  final String isBestSeller;
  final String colorName;
  final String colorCode;
  final String name;
  final String slug;
  final dynamic mrp;
  final dynamic price;
  final String availability;
  final String extraPrice;
  final dynamic productName;
  final String categoriesName;
  final List<ProductAttribute> productAttributes;
  final List<String?> images;
  final bool wishlist;

  FiftyProductModel({
    required this.id,
    required this.frameWidth,
    required this.lenseWidth,
    required this.isBestSeller,
    required this.colorName,
    required this.colorCode,
    required this.name,
    required this.slug,
    required this.mrp,
    required this.price,
    required this.availability,
    required this.extraPrice,
    required this.productName,
    required this.categoriesName,
    required this.productAttributes,
    required this.images,
    required this.wishlist,
  });

  factory FiftyProductModel.fromJson(Map<String, dynamic> json) =>
      FiftyProductModel(
        id: json["id"],
        frameWidth: json["frame_width"],
        lenseWidth: json["lense_width"],
        isBestSeller: json["is_best_seller"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
        name: json["name"],
        slug: json["slug"],
        mrp: json["mrp"],
        price: json["price"],
        availability: json["availability"],
        extraPrice: json["extra_price"],
        productName: json["product_name"],
        categoriesName: json["categories_name"],
        productAttributes: List<ProductAttribute>.from(
            json["product_attributes"]
                .map((x) => ProductAttribute.fromJson(x))),
        images: List<String?>.from(json["images"].map((x) => x)),
        wishlist: json["wishlist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "frame_width": frameWidth,
        "lense_width": lenseWidth,
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
        "product_attributes":
            List<dynamic>.from(productAttributes.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x)),
        "wishlist": wishlist,
      };
}

class ProductAttribute {
  final int id;
  final int productId;
  final String colorName;
  final String colorCode;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final String image6;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductAttribute({
    required this.id,
    required this.productId,
    required this.colorName,
    required this.colorCode,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      ProductAttribute(
        id: json["id"],
        productId: json["product_id"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        image6: json["image6"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "color_name": colorName,
        "color_code": colorCode,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "image6": image6,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
