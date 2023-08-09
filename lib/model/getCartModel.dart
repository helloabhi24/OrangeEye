// To parse this JSON data, do
//
//     final getCartModel = getCartModelFromJson(jsonString);

import 'dart:convert';

GetCartModel getCartModelFromJson(String str) =>
    GetCartModel.fromJson(json.decode(str));

String getCartModelToJson(GetCartModel data) => json.encode(data.toJson());

class GetCartModel {
  final dynamic lensId;
  final dynamic lensName;
  final dynamic lensMrp;
  final dynamic lcgst;
  final dynamic ligst;
  final dynamic lsgst;
  final dynamic lensPrice;
  final dynamic lensImage;
  final dynamic colorId;
  final dynamic colorCode;
  final dynamic colorName;
  final dynamic image1;
  final int id;
  final dynamic size;
  final dynamic color;
  final dynamic lens;
  final dynamic prescription;
  final dynamic productId;
  final String qty;
  final String name;
  final String pimage;
  final dynamic pcgst;
  final dynamic psgst;
  final dynamic pigst;
  final String slug;
  final dynamic mrp;
  final dynamic price;
  final String modelNumber;
  final int productSubtotal;
  final int productTax;
  final dynamic lenseSubtotal;
  final dynamic lenseTax;
  final int subtotal;

  GetCartModel({
    this.lensId,
    this.lensName,
    this.lensMrp,
    this.lcgst,
    this.ligst,
    this.lsgst,
    this.lensPrice,
    this.lensImage,
    this.colorId,
    this.colorCode,
    this.colorName,
    this.image1,
    required this.id,
    required this.size,
    this.color,
    this.lens,
    this.prescription,
    required this.productId,
    required this.qty,
    required this.name,
    required this.pimage,
    required this.pcgst,
    required this.psgst,
    required this.pigst,
    required this.slug,
    required this.mrp,
    required this.price,
    required this.modelNumber,
    required this.productSubtotal,
    required this.productTax,
    this.lenseSubtotal,
    this.lenseTax,
    required this.subtotal,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        lensId: json["lens_id"],
        lensName: json["lens_name"],
        lensMrp: json["lens_mrp"],
        lcgst: json["lcgst"],
        ligst: json["ligst"],
        lsgst: json["lsgst"],
        lensPrice: json["lens_price"],
        lensImage: json["lens_image"],
        colorId: json["color_id"],
        colorCode: json["color_code"],
        colorName: json["color_name"],
        image1: json["image1"],
        id: json["id"],
        size: json["size"],
        color: json["color"],
        lens: json["lens"],
        prescription: json["prescription"],
        productId: json["product_id"],
        qty: json["qty"],
        name: json["name"],
        pimage: json["pimage"],
        pcgst: json["pcgst"],
        psgst: json["psgst"],
        pigst: json["pigst"],
        slug: json["slug"],
        mrp: json["mrp"],
        price: json["price"],
        modelNumber: json["model_number"],
        productSubtotal: json["product_subtotal"],
        productTax: json["product_tax"],
        lenseSubtotal: json["lense_subtotal"],
        lenseTax: json["lense_tax"],
        subtotal: json["subtotal"],
      );

  Map<String, dynamic> toJson() => {
        "lens_id": lensId,
        "lens_name": lensName,
        "lens_mrp": lensMrp,
        "lcgst": lcgst,
        "ligst": ligst,
        "lsgst": lsgst,
        "lens_price": lensPrice,
        "lens_image": lensImage,
        "color_id": colorId,
        "color_code": colorCode,
        "color_name": colorName,
        "image1": image1,
        "id": id,
        "size": size,
        "color": color,
        "lens": lens,
        "prescription": prescription,
        "product_id": productId,
        "qty": qty,
        "name": name,
        "pimage": pimage,
        "pcgst": pcgst,
        "psgst": psgst,
        "pigst": pigst,
        "slug": slug,
        "mrp": mrp,
        "price": price,
        "model_number": modelNumber,
        "product_subtotal": productSubtotal,
        "product_tax": productTax,
        "lense_subtotal": lenseSubtotal,
        "lense_tax": lenseTax,
        "subtotal": subtotal,
      };
}
