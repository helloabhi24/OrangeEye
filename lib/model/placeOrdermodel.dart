// To parse this JSON data, do
//
//     final placeOrderModel = placeOrderModelFromJson(jsonString);

import 'dart:convert';

PlaceOrderModel placeOrderModelFromJson(String str) =>
    PlaceOrderModel.fromJson(json.decode(str));

String placeOrderModelToJson(PlaceOrderModel data) =>
    json.encode(data.toJson());

class PlaceOrderModel {
  final int id;
  final String orderId;
  final dynamic trackingId;
  final dynamic customerId;
  final String name;
  final String email;
  final String phone;
  final dynamic country;
  final dynamic state;
  final dynamic city;
  final dynamic zip;
  final String address;
  final dynamic shipName;
  final dynamic shipEmail;
  final dynamic shipPhone;
  final dynamic shipCountry;
  final dynamic shipState;
  final dynamic shipCity;
  final dynamic shipZip;
  final dynamic shipAddress;
  final DateTime date;
  final dynamic subTotal;
  final dynamic discountCode;
  final dynamic discountPrice;
  final dynamic shippingCharge;
  final dynamic gtotal;
  final dynamic cgst;
  final dynamic sgst;
  final dynamic igst;
  final String paymentMethod;
  final String paymentStatus;
  final String orderStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  PlaceOrderModel({
    required this.id,
    required this.orderId,
    this.trackingId,
    required this.customerId,
    required this.name,
    required this.email,
    required this.phone,
    required this.country,
    required this.state,
    required this.city,
    required this.zip,
    required this.address,
    this.shipName,
    this.shipEmail,
    this.shipPhone,
    this.shipCountry,
    this.shipState,
    this.shipCity,
    this.shipZip,
    this.shipAddress,
    required this.date,
    required this.subTotal,
    this.discountCode,
    required this.discountPrice,
    required this.shippingCharge,
    required this.gtotal,
    this.cgst,
    this.sgst,
    this.igst,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) =>
      PlaceOrderModel(
        id: json["id"],
        orderId: json["order_id"],
        trackingId: json["tracking_id"],
        customerId: json["customer_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zip: json["zip"],
        address: json["address"],
        shipName: json["ship_name"],
        shipEmail: json["ship_email"],
        shipPhone: json["ship_phone"],
        shipCountry: json["ship_country"],
        shipState: json["ship_state"],
        shipCity: json["ship_city"],
        shipZip: json["ship_zip"],
        shipAddress: json["ship_address"],
        date: DateTime.parse(json["date"]),
        subTotal: json["sub_total"],
        discountCode: json["discount_code"],
        discountPrice: json["discount_price"],
        shippingCharge: json["shipping_charge"],
        gtotal: json["gtotal"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        igst: json["igst"],
        paymentMethod: json["payment_method"],
        paymentStatus: json["payment_status"],
        orderStatus: json["order_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "tracking_id": trackingId,
        "customer_id": customerId,
        "name": name,
        "email": email,
        "phone": phone,
        "country": country,
        "state": state,
        "city": city,
        "zip": zip,
        "address": address,
        "ship_name": shipName,
        "ship_email": shipEmail,
        "ship_phone": shipPhone,
        "ship_country": shipCountry,
        "ship_state": shipState,
        "ship_city": shipCity,
        "ship_zip": shipZip,
        "ship_address": shipAddress,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "sub_total": subTotal,
        "discount_code": discountCode,
        "discount_price": discountPrice,
        "shipping_charge": shippingCharge,
        "gtotal": gtotal,
        "cgst": cgst,
        "sgst": sgst,
        "igst": igst,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "order_status": orderStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
