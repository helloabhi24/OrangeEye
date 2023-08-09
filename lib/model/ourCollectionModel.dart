// To parse this JSON data, do
//
//     final ourShopCollectionModel = ourShopCollectionModelFromJson(jsonString);

import 'dart:convert';

OurShopCollectionModel ourShopCollectionModelFromJson(String str) =>
    OurShopCollectionModel.fromJson(json.decode(str));

String ourShopCollectionModelToJson(OurShopCollectionModel data) =>
    json.encode(data.toJson());

class OurShopCollectionModel {
  final int id;
  final String name;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final FrameProduct frameProduct;

  OurShopCollectionModel({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.frameProduct,
  });

  factory OurShopCollectionModel.fromJson(Map<String, dynamic> json) =>
      OurShopCollectionModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        frameProduct: FrameProduct.fromJson(json["frame_product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "frame_product": frameProduct.toJson(),
      };
}

class FrameProduct {
  final int id;
  final String name;
  final String slug;
  final String hsnCode;
  final String modelNumber;
  final int category;
  final String colorName;
  final String colorCode;
  final dynamic brand;
  final int productType;
  final int frameMaterial;
  final int frameType;
  final int frameShape;
  final dynamic lens;
  final List<String> frameSize;
  final dynamic mrp;
  final dynamic price;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final String image6;
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

  FrameProduct({
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
    this.lens,
    required this.frameSize,
    required this.mrp,
    required this.price,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
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
  });

  factory FrameProduct.fromJson(Map<String, dynamic> json) => FrameProduct(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        hsnCode: json["hsn_code"],
        modelNumber: json["model_number"],
        category: json["category"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
        brand: json["brand"],
        productType: json["product_type"],
        frameMaterial: json["frame_material"],
        frameType: json["frame_type"],
        frameShape: json["frame_shape"],
        lens: json["lens"],
        frameSize: List<String>.from(json["frame_size"].map((x) => x)),
        mrp: json["mrp"],
        price: json["price"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        image6: json["image6"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "hsn_code": hsnCode,
        "model_number": modelNumber,
        "category": category,
        "color_name": colorName,
        "color_code": colorCode,
        "brand": brand,
        "product_type": productType,
        "frame_material": frameMaterial,
        "frame_type": frameType,
        "frame_shape": frameShape,
        "lens": lens,
        "frame_size": List<dynamic>.from(frameSize.map((x) => x)),
        "mrp": mrp,
        "price": price,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "image6": image6,
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
      };
}
