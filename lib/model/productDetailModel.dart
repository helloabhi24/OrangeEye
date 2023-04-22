// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  ProductDetailModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.modelNumber,
    required this.category,
    this.brand,
    required this.productType,
    required this.frameMaterial,
    required this.frameType,
    required this.frameShape,
    this.frameColor,
    required this.lens,
    required this.frameSize,
    required this.mrp,
    required this.price,
    required this.shortDescription,
    required this.description,
    this.exraDescription,
    this.sizeGuid,
    required this.availaility,
    required this.isBestSeller,
    required this.isNewArrival,
    required this.temple,
    required this.bridge,
    this.cgst,
    this.sgst,
    this.igst,
    required this.extraPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.producttype,
    required this.frametype,
    required this.framematerial,
    required this.frameshape,
    required this.productAttributes,
    required this.images,
  });

  final int? id;
  final String? name;
  final String? slug;
  final String? modelNumber;
  final Category? category;
  final dynamic? brand;
  final int? productType;
  final int? frameMaterial;
  final int? frameType;
  final int? frameShape;
  final dynamic? frameColor;
  final List<Category>? lens;
  final List<Category>? frameSize;
  final int? mrp;
  final int? price;
  final String? shortDescription;
  final String? description;
  final dynamic exraDescription;
  final dynamic sizeGuid;
  final String? availaility;
  final String? isBestSeller;
  final String? isNewArrival;
  final String? temple;
  final String? bridge;
  final dynamic cgst;
  final dynamic sgst;
  final dynamic igst;
  final int? extraPrice;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Category? producttype;
  final Category? frametype;
  final Category? framematerial;
  final Category? frameshape;
  final List<ProductAttribute>? productAttributes;
  final List<String>? images;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        modelNumber: json["model_number"],
        category: Category.fromJson(json["category"]),
        brand: json["brand"],
        productType: json["product_type"],
        frameMaterial: json["frame_material"],
        frameType: json["frame_type"],
        frameShape: json["frame_shape"],
        frameColor: json["frame_color"],
        lens:
            List<Category>.from(json["lens"].map((x) => Category.fromJson(x))),
        frameSize: List<Category>.from(
            json["frame_size"].map((x) => Category.fromJson(x))),
        mrp: json["mrp"],
        price: json["price"],
        shortDescription: json["short_description"],
        description: json["description"],
        exraDescription: json["exra_description"],
        sizeGuid: json["size_guid"],
        availaility: json["availaility"],
        isBestSeller: json["is_best_seller"],
        isNewArrival: json["is_new_arrival"],
        temple: json["temple"],
        bridge: json["bridge"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        igst: json["igst"],
        extraPrice: json["extra_price"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        producttype: Category.fromJson(json["producttype"]),
        frametype: Category.fromJson(json["frametype"]),
        framematerial: Category.fromJson(json["framematerial"]),
        frameshape: Category.fromJson(json["frameshape"]),
        productAttributes: List<ProductAttribute>.from(
            json["product_attributes"]
                .map((x) => ProductAttribute.fromJson(x))),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "model_number": modelNumber,
        "category": category!.toJson(),
        "brand": brand,
        "product_type": productType,
        "frame_material": frameMaterial,
        "frame_type": frameType,
        "frame_shape": frameShape,
        "frame_color": frameColor,
        "lens": List<dynamic>.from(lens!.map((x) => x.toJson())),
        "frame_size": List<dynamic>.from(frameSize!.map((x) => x.toJson())),
        "mrp": mrp,
        "price": price,
        "short_description": shortDescription,
        "description": description,
        "exra_description": exraDescription,
        "size_guid": sizeGuid,
        "availaility": availaility,
        "is_best_seller": isBestSeller,
        "is_new_arrival": isNewArrival,
        "temple": temple,
        "bridge": bridge,
        "cgst": cgst,
        "sgst": sgst,
        "igst": igst,
        "extra_price": extraPrice,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "producttype": producttype!.toJson(),
        "frametype": frametype!.toJson(),
        "framematerial": framematerial!.toJson(),
        "frameshape": frameshape!.toJson(),
        "product_attributes":
            List<dynamic>.from(productAttributes!.map((x) => x.toJson())),
        "images": List<dynamic>.from(images!.map((x) => x)),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.mrp,
    this.price,
  });

  final int? id;
  final String? name;
  final String? image;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? mrp;
  final int? price;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        mrp: json["mrp"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "mrp": mrp,
        "price": price,
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

  final int? id;
  final int? productId;
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
