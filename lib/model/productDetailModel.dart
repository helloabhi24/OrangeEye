// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  final int id;
  final String name;
  final String slug;
  final String hsnCode;
  final String modelNumber;
  final Category category;
  final String colorName;
  final String colorCode;
  final dynamic brand;
  final int productType;
  final int frameMaterial;
  final int frameType;
  final int frameShape;
  final List<List<dynamic>> lens;
  final List<Category> frameSize;
  final dynamic mrp;
  final dynamic price;
  final String shortDescription;
  final String description;
  final dynamic exraDescription;
  final dynamic sizeGuid;
  final String availaility;
  final String isBestSeller;
  final String isNewArrival;
  final String temple;
  final String bridge;
  final String lenseWidth;
  final String frameWidth;
  final int cgst;
  final int sgst;
  final int igst;
  final dynamic extraPrice;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Category producttype;
  final Category frametype;
  final Category framematerial;
  final Category frameshape;
  final List<ProductAttribute> productAttributes;
  final bool wishlist;

  ProductDetailModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.hsnCode,
    required this.modelNumber,
    required this.category,
    required this.colorName,
    required this.colorCode,
    this.brand,
    required this.productType,
    required this.frameMaterial,
    required this.frameType,
    required this.frameShape,
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
    required this.lenseWidth,
    required this.frameWidth,
    required this.cgst,
    required this.sgst,
    required this.igst,
    this.extraPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.producttype,
    required this.frametype,
    required this.framematerial,
    required this.frameshape,
    required this.productAttributes,
    required this.wishlist,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        hsnCode: json["hsn_code"],
        modelNumber: json["model_number"],
        category: Category.fromJson(json["category"]),
        colorName: json["color_name"],
        colorCode: json["color_code"],
        brand: json["brand"],
        productType: json["product_type"],
        frameMaterial: json["frame_material"],
        frameType: json["frame_type"],
        frameShape: json["frame_shape"],
        lens: List<List<dynamic>>.from(
            json["lens"].map((x) => List<dynamic>.from(x.map((x) => x)))),
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
        lenseWidth: json["lense_width"],
        frameWidth: json["frame_width"],
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
        wishlist: json["wishlist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "hsn_code": hsnCode,
        "model_number": modelNumber,
        "category": category.toJson(),
        "color_name": colorName,
        "color_code": colorCode,
        "brand": brand,
        "product_type": productType,
        "frame_material": frameMaterial,
        "frame_type": frameType,
        "frame_shape": frameShape,
        "lens": List<dynamic>.from(
            lens.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "frame_size": List<dynamic>.from(frameSize.map((x) => x.toJson())),
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
        "lense_width": lenseWidth,
        "frame_width": frameWidth,
        "cgst": cgst,
        "sgst": sgst,
        "igst": igst,
        "extra_price": extraPrice,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "producttype": producttype.toJson(),
        "frametype": frametype.toJson(),
        "framematerial": framematerial.toJson(),
        "frameshape": frameshape.toJson(),
        "product_attributes":
            List<dynamic>.from(productAttributes.map((x) => x.toJson())),
        "wishlist": wishlist,
      };
}

class Category {
  final int id;
  final String name;
  final String? image;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class ProductAttribute {
  final int id;
  final dynamic productId;
  final String colorName;
  final String colorCode;
  final List<String> images;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductAttribute({
    required this.id,
    required this.productId,
    required this.colorName,
    required this.colorCode,
    required this.images,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      ProductAttribute(
        id: json["id"],
        productId: json["product_id"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
        images: List<String>.from(json["images"].map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "color_name": colorName,
        "color_code": colorCode,
        "images": List<dynamic>.from(images.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
