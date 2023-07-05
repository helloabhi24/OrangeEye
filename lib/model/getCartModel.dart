// To parse this JSON data, do
//
//     final getCartModel = getCartModelFromJson(jsonString);

import 'dart:convert';

GetCartModel getCartModelFromJson(String str) =>
    GetCartModel.fromJson(json.decode(str));

String getCartModelToJson(GetCartModel data) => json.encode(data.toJson());

class GetCartModel {
  final String? lensId;
  final String? lensName;
  final String? lensMrp;
  final String? lcgst;
  final String? ligst;
  final String? lsgst;
  final String? lensPrice;
  final String? lensImage;
  final String? colorId;
  final String? colorCode;
  final String? colorName;
  final String? image1;
  final int? id;
  final String? size;
  final String? color;
  final String? lens;
  final String? prescription;
  final String? productId;
  final String? qty;
  final String? name;
  final String? pcgst;
  final String? psgst;
  final String? pigst;
  final String? slug;
  final String? mrp;
  final String? price;
  final String? modelNumber;
  final int? productSubtotal;
  final int? productTax;
  final int? lenseSubtotal;
  final int? lenseTax;
  final int? subtotal;
  final String? pImage;

  GetCartModel({
    required this.lensId,
    required this.lensName,
    required this.lensMrp,
    required this.lcgst,
    required this.ligst,
    required this.lsgst,
    required this.lensPrice,
    required this.lensImage,
    required this.colorId,
    required this.colorCode,
    required this.colorName,
    required this.image1,
    required this.id,
    required this.size,
    required this.color,
    required this.lens,
    required this.prescription,
    required this.productId,
    required this.qty,
    required this.name,
    required this.pcgst,
    required this.psgst,
    required this.pigst,
    required this.slug,
    required this.mrp,
    required this.price,
    required this.modelNumber,
    required this.productSubtotal,
    required this.productTax,
    required this.lenseSubtotal,
    required this.lenseTax,
    required this.subtotal,
    required this.pImage,
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
        pImage: json["pimage"]
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
        "pimage" : pImage
      };
}
