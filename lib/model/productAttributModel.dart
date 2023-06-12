// // To parse this JSON data, do
// //
// //     final productColorModel = productColorModelFromJson(jsonString);

// import 'dart:convert';

// ProductColorModel productColorModelFromJson(String str) =>
//     ProductColorModel.fromJson(json.decode(str));

// String productColorModelToJson(ProductColorModel data) =>
//     json.encode(data.toJson());

// class ProductColorModel {
//   ProductColorModel({
//     required this.id,
//     required this.productId,
//     required this.colorName,
//     required this.colorCode,
//     required this.image1,
//     required this.image2,
//     required this.image3,
//     required this.image4,
//     required this.image5,
//     required this.image6,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   final int id;
//   final int productId;
//   final String colorName;
//   final String colorCode;
//   final String image1;
//   final String image2;
//   final String image3;
//   final String image4;
//   final String image5;
//   final String image6;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   factory ProductColorModel.fromJson(Map<String, dynamic> json) =>
//       ProductColorModel(
//         id: json["id"],
//         productId: json["product_id"],
//         colorName: json["color_name"],
//         colorCode: json["color_code"],
//         image1: json["image1"],
//         image2: json["image2"],
//         image3: json["image3"],
//         image4: json["image4"],
//         image5: json["image5"],
//         image6: json["image6"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "product_id": productId,
//         "color_name": colorName,
//         "color_code": colorCode,
//         "image1": image1,
//         "image2": image2,
//         "image3": image3,
//         "image4": image4,
//         "image5": image5,
//         "image6": image6,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
