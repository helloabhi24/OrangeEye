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
  final dynamic productId;
  final String productName;
  final dynamic hsnCode;
  final String image;
  final String modelNumber;
  final dynamic category;
  final dynamic brand;
  final dynamic productType;
  final dynamic frameMaterial;
  final dynamic frameType;
  final dynamic frameShape;
  final dynamic frameSize;
  final dynamic prescription;
  final String frameSizeName;
  final dynamic lensId;
  final dynamic lensName;
  final dynamic lensImage;
  final dynamic lensPrice;
  final dynamic lensCgst;
  final dynamic lensSgst;
  final dynamic lensIgst;
  final dynamic colorId;
  final String colorName;
  final String colorCode;
  final String colorImage;
  final dynamic mrp;
  final dynamic price;
  final dynamic qty;
  final String temple;
  final String bridge;
  final dynamic cgst;
  final dynamic sgst;
  final dynamic igst;
  final dynamic extraPrice;
  final dynamic totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int productTax;
  final dynamic lenseTax;

  PlaceOrderItemsModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    this.hsnCode,
    required this.image,
    required this.modelNumber,
    required this.category,
    this.brand,
    required this.productType,
    required this.frameMaterial,
    required this.frameType,
    required this.frameShape,
    required this.frameSize,
    this.prescription,
    required this.frameSizeName,
    this.lensId,
    this.lensName,
    this.lensImage,
    this.lensPrice,
    this.lensCgst,
    this.lensSgst,
    this.lensIgst,
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
    required this.productTax,
    this.lenseTax,
  });

  factory PlaceOrderItemsModel.fromJson(Map<String, dynamic> json) =>
      PlaceOrderItemsModel(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        hsnCode: json["hsn_code"],
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
        productTax: json["product_tax"],
        lenseTax: json["lense_tax"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "product_name": productName,
        "hsn_code": hsnCode,
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
        "product_tax": productTax,
        "lense_tax": lenseTax,
      };
}
