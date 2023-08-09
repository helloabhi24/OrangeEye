// To parse this JSON data, do
//
//     final whislistModel = whislistModelFromJson(jsonString);

import 'dart:convert';

WhislistModel whislistModelFromJson(String str) =>
    WhislistModel.fromJson(json.decode(str));

String whislistModelToJson(WhislistModel data) => json.encode(data.toJson());

class WhislistModel {
  WhislistModel({
    required this.id,
    required this.productId,
    required this.product,
  });

  final int? id;
  final String? productId;
  final List<Product>? product;

  factory WhislistModel.fromJson(Map<String, dynamic> json) => WhislistModel(
        id: json["id"],
        productId: json["product_id"],
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product": List<dynamic>.from(product!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.colorName,
    required this.colorCode,
    required this.name,
    required this.slug,
    required this.lens,
    required this.frameSize,
    required this.mrp,
    required this.price,
    required this.productAttributes,
  });

  final int id;
  final String? colorName;
  final String? colorCode;
  final String? name;
  final String? slug;
  final List<String>? lens;
  final List<FrameSize>? frameSize;
  final dynamic mrp;
  final dynamic price;
  final List<ProductAttribute>? productAttributes;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
        name: json["name"],
        slug: json["slug"],
        lens: List<String>.from(json["lens"].map((x) => x)),
        frameSize: List<FrameSize>.from(
            json["frame_size"].map((x) => FrameSize.fromJson(x))),
        mrp: json["mrp"],
        price: json["price"],
        productAttributes: List<ProductAttribute>.from(
            json["product_attributes"]
                .map((x) => ProductAttribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color_name": colorName,
        "color_code": colorCode,
        "name": name,
        "slug": slug,
        "lens": List<dynamic>.from(lens!.map((x) => x)),
        "frame_size": List<dynamic>.from(frameSize!.map((x) => x.toJson())),
        "mrp": mrp,
        "price": price,
        "product_attributes":
            List<dynamic>.from(productAttributes!.map((x) => x.toJson())),
      };
}

class FrameSize {
  FrameSize({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory FrameSize.fromJson(Map<String, dynamic> json) => FrameSize(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class ProductAttribute {
  ProductAttribute({
    required this.id,
    required this.productId,
    required this.colorName,
    required this.colorCode,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  final int id;
  final String? productId;
  final String? colorName;
  final String? colorCode;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? images;

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      ProductAttribute(
        id: json["id"],
        productId: json["product_id"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "color_name": colorName,
        "color_code": colorCode,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "images": List<dynamic>.from(images!.map((x) => x)),
      };
}
