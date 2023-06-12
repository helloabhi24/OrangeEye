// To parse this JSON data, do
//
//     final placeOrderItemsModel = placeOrderItemsModelFromJson(jsonString);

import 'dart:convert';

PlaceOrderItemsModel placeOrderItemsModelFromJson(String str) =>
    PlaceOrderItemsModel.fromJson(json.decode(str));

String placeOrderItemsModelToJson(PlaceOrderItemsModel data) =>
    json.encode(data.toJson());

class PlaceOrderItemsModel {
  final int id;
  final String orderId;
  final String productId;
  final String productName;
  final String image;
  final String modelNumber;
  final String category;
  final dynamic brand;
  final String productType;
  final String frameMaterial;
  final String frameType;
  final String frameShape;
  final String frameSize;
  final String prescription;
  final String frameSizeName;
  final String lensId;
  final String lensName;
  final String lensImage;
  final String lensPrice;
  final String lensCgst;
  final String lensSgst;
  final String lensIgst;
  final String colorId;
  final String colorName;
  final String colorCode;
  final String colorImage;
  final String mrp;
  final String price;
  final String qty;
  final String temple;
  final String bridge;
  final String cgst;
  final String sgst;
  final String igst;
  final dynamic extraPrice;
  final String totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;

  PlaceOrderItemsModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.image,
    required this.modelNumber,
    required this.category,
    this.brand,
    required this.productType,
    required this.frameMaterial,
    required this.frameType,
    required this.frameShape,
    required this.frameSize,
    required this.prescription,
    required this.frameSizeName,
    required this.lensId,
    required this.lensName,
    required this.lensImage,
    required this.lensPrice,
    required this.lensCgst,
    required this.lensSgst,
    required this.lensIgst,
    required this.colorId,
    required this.colorName,
    required this.colorCode,
    required this.colorImage,
    required this.mrp,
    required this.price,
    required this.qty,
    required this.temple,
    required this.bridge,
    required this.cgst,
    required this.sgst,
    required this.igst,
    this.extraPrice,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PlaceOrderItemsModel.fromJson(Map<String, dynamic> json) =>
      PlaceOrderItemsModel(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        image: json["image"],
        modelNumber: json["model_number"],
        category: json["category"],
        brand: json["brand"],
        productType: json["product_type"],
        frameMaterial: json["frame_material"],
        frameType: json["frame_type"],
        frameShape: json["frame_shape"],
        frameSize: json["frame_size"],
        prescription: json["prescription"],
        frameSizeName: json["frame_size_name"],
        lensId: json["lens_id"],
        lensName: json["lens_name"],
        lensImage: json["lens_image"],
        lensPrice: json["lens_price"],
        lensCgst: json["lens_cgst"],
        lensSgst: json["lens_sgst"],
        lensIgst: json["lens_igst"],
        colorId: json["color_id"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
        colorImage: json["color_image"],
        mrp: json["mrp"],
        price: json["price"],
        qty: json["qty"],
        temple: json["temple"],
        bridge: json["bridge"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        igst: json["igst"],
        extraPrice: json["extra_price"],
        totalPrice: json["total_price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "product_name": productName,
        "image": image,
        "model_number": modelNumber,
        "category": category,
        "brand": brand,
        "product_type": productType,
        "frame_material": frameMaterial,
        "frame_type": frameType,
        "frame_shape": frameShape,
        "frame_size": frameSize,
        "prescription": prescription,
        "frame_size_name": frameSizeName,
        "lens_id": lensId,
        "lens_name": lensName,
        "lens_image": lensImage,
        "lens_price": lensPrice,
        "lens_cgst": lensCgst,
        "lens_sgst": lensSgst,
        "lens_igst": lensIgst,
        "color_id": colorId,
        "color_name": colorName,
        "color_code": colorCode,
        "color_image": colorImage,
        "mrp": mrp,
        "price": price,
        "qty": qty,
        "temple": temple,
        "bridge": bridge,
        "cgst": cgst,
        "sgst": sgst,
        "igst": igst,
        "extra_price": extraPrice,
        "total_price": totalPrice,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
