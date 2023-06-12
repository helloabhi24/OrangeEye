import 'dart:convert';

ProductCategoryModel productCategoryModelFromJson(String str) =>
    ProductCategoryModel.fromJson(json.decode(str));

String productCategoryModelToJson(ProductCategoryModel data) =>
    json.encode(data.toJson());

class ProductCategoryModel {
  ProductCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.mrp,
    required this.price,
    required this.availability,
    required this.extraPrice,
    required this.productName,
    required this.categoriesName,
    required this.images,
    required this.wishlist,
    required this.productAttributes,
  });

  final int id;
  final String? name;
  final String? slug;
  final String? mrp;
  final String? price;
  final String? availability;
  final dynamic extraPrice;
  final String? productName;
  final String? categoriesName;
  final List<String>? images;
  final bool? wishlist;
  final List<ProductAttribute>? productAttributes;

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoryModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        mrp: json["mrp"],
        price: json["price"],
        availability: json["availability"],
        extraPrice: json["extra_price"],
        productName: json["product_name"],
        categoriesName: json["categories_name"],
        images: List<String>.from(json["images"].map((x) => x)),
        wishlist: json["wishlist"],
        productAttributes: List<ProductAttribute>.from(
            json["product_attributes"]
                .map((x) => ProductAttribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "mrp": mrp,
        "price": price,
        "availability": availability,
        "extra_price": extraPrice,
        "product_name": productName,
        "categories_name": categoriesName,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "wishlist": wishlist,
        "product_attributes":
            List<dynamic>.from(productAttributes!.map((x) => x.toJson())),
      };
}

class ProductAttribute {
  ProductAttribute({
    required this.id,
    required this.productId,
    required this.colorName,
    required this.colorCode,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String productId;
  final dynamic colorName;
  final dynamic colorCode;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? image5;
  final String? image6;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      ProductAttribute(
        id: json["id"],
        productId: json["product_id"],
        colorName: json["color_name"],
        colorCode: json["color_code"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        image6: json["image6"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "color_name": colorName,
        "color_code": colorCode,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "image6": image6,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}




































// class ProductCategoryModel {
//   ProductCategoryModel({
//     required this.id,
//     required this.name,
//     required this.slug,
//     required this.mrp,
//     required this.price,
//     required this.availability,
//     required this.extraPrice,
//     required this.productName,
//     required this.categoriesName,
//     required this.images,
//     required this.productAttributes,
//   });

//   final int? id;
//   final String? name;
//   final String? slug;
//   final int? mrp;
//   final int? price;
//   final String? availability;
//   final int? extraPrice;
//   final String? productName;
//   final String? categoriesName;
//   List<String>? images;
//   List<ProductColorModel>? productAttributes;

//   factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
//       ProductCategoryModel(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         mrp: json["mrp"],
//         price: json["price"],
//         availability: json["availability"],
//         extraPrice: json["extra_price"],
//         productName: json["product_name"],
//         categoriesName: json["categories_name"],
//         images: List<String>.from(json["images"].map((x) => x)),
//         productAttributes: List<ProductColorModel>.from(
//             json["product_attributes"]
//                 .map((x) => ProductColorModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "mrp": mrp,
//         "price": price,
//         "availability": availability,
//         "extra_price": extraPrice,
//         "product_name": productName,
//         "categories_name": categoriesName,
//         "images": List<String>.from(images!.map((x) => x)).toList(),
//         "product_attributes":
//             List<dynamic>.from(productAttributes!.map((x) => x.toJson())),
//       };
// }

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
//       };
// }
