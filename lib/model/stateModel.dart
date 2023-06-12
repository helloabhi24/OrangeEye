// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) =>
    StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  final int id;
  final String name;
  final String countryId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  StateModel({
    required this.id,
    required this.name,
    required this.countryId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
