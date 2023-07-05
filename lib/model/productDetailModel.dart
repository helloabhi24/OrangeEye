// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
    final int? id;
    final String? name;
    final String? slug;
    final String? hsnCode;
    final String? modelNumber;
    final Category? category;
    final String? colorName;
    final String? colorCode;
    final dynamic brand;
    final String? productType;
    final String? frameMaterial;
    final String? frameType;
    final String? frameShape;
    final List<List<dynamic>>? lens;
    final List<Category>? frameSize;
    final String? mrp;
    final String? price;
    final String? shortDescription;
    final String? description;
    final dynamic exraDescription;
    final dynamic sizeGuid;
    final String? availaility;
    final String? isBestSeller;
    final String? isNewArrival;
    final String? temple;
    final String? bridge;
    final String? cgst;
    final String? sgst;
    final String? igst;
    final dynamic extraPrice;
    final String? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Category? producttype;
    final Category? frametype;
    final Category? framematerial;
    final Category? frameshape;
    final List<ProductAttribute>? productAttributes;
    final List<String>? images;

    ProductDetailModel({
        this.id,
        this.name,
        this.slug,
        this.hsnCode,
        this.modelNumber,
        this.category,
        this.colorName,
        this.colorCode,
        this.brand,
        this.productType,
        this.frameMaterial,
        this.frameType,
        this.frameShape,
        this.lens,
        this.frameSize,
        this.mrp,
        this.price,
        this.shortDescription,
        this.description,
        this.exraDescription,
        this.sizeGuid,
        this.availaility,
        this.isBestSeller,
        this.isNewArrival,
        this.temple,
        this.bridge,
        this.cgst,
        this.sgst,
        this.igst,
        this.extraPrice,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.producttype,
        this.frametype,
        this.framematerial,
        this.frameshape,
        this.productAttributes,
        this.images,
    });

    factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        hsnCode: json["hsn_code"],
        modelNumber: json["model_number"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        colorName: json["color_name"],
        colorCode: json["color_code"],
        brand: json["brand"],
        productType: json["product_type"],
        frameMaterial: json["frame_material"],
        frameType: json["frame_type"],
        frameShape: json["frame_shape"],
        lens: json["lens"] == null ? [] : List<List<dynamic>>.from(json["lens"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        frameSize: json["frame_size"] == null ? [] : List<Category>.from(json["frame_size"]!.map((x) => Category.fromJson(x))),
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        producttype: json["producttype"] == null ? null : Category.fromJson(json["producttype"]),
        frametype: json["frametype"] == null ? null : Category.fromJson(json["frametype"]),
        framematerial: json["framematerial"] == null ? null : Category.fromJson(json["framematerial"]),
        frameshape: json["frameshape"] == null ? null : Category.fromJson(json["frameshape"]),
        productAttributes: json["product_attributes"] == null ? [] : List<ProductAttribute>.from(json["product_attributes"]!.map((x) => ProductAttribute.fromJson(x))),
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "hsn_code": hsnCode,
        "model_number": modelNumber,
        "category": category?.toJson(),
        "color_name": colorName,
        "color_code": colorCode,
        "brand": brand,
        "product_type": productType,
        "frame_material": frameMaterial,
        "frame_type": frameType,
        "frame_shape": frameShape,
        "lens": lens == null ? [] : List<dynamic>.from(lens!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "frame_size": frameSize == null ? [] : List<dynamic>.from(frameSize!.map((x) => x.toJson())),
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "producttype": producttype?.toJson(),
        "frametype": frametype?.toJson(),
        "framematerial": framematerial?.toJson(),
        "frameshape": frameshape?.toJson(),
        "product_attributes": productAttributes == null ? [] : List<dynamic>.from(productAttributes!.map((x) => x.toJson())),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    };
}

class Category {
    final int? id;
    final String? name;
    final String? image;
    final String? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Category({
        this.id,
        this.name,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class ProductAttribute {
    final int? id;
    final String? productId;
    final String? colorName;
    final String? colorCode;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<String>? images;

    ProductAttribute({
        this.id,
        this.productId,
        this.colorName,
        this.colorCode,
        this.createdAt,
        this.updatedAt,
        this.images,
    });

    factory ProductAttribute.fromJson(Map<String, dynamic> json) => ProductAttribute(
        id: json["id"],
        productId: json["product_id"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "color_name": colorName,
        "color_code": colorCode,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    };
}
