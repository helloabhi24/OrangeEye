// To parse this JSON data, do
//
//     final homePageSliderModel = homePageSliderModelFromJson(jsonString);

import 'dart:convert';

HomePageSliderModel homePageSliderModelFromJson(String str) =>
    HomePageSliderModel.fromJson(json.decode(str));

String homePageSliderModelToJson(HomePageSliderModel data) =>
    json.encode(data.toJson());

class HomePageSliderModel {
  HomePageSliderModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String image;
  final String description;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory HomePageSliderModel.fromJson(Map<String, dynamic> json) =>
      HomePageSliderModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
