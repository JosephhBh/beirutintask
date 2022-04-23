// To parse this JSON data, do
//
//     final tipperModel = tipperModelFromJson(jsonString);

import 'dart:convert';

TipperModel tipperModelFromJson(String str) =>
    TipperModel.fromJson(json.decode(str));

String tipperModelToJson(TipperModel data) => json.encode(data.toJson());

class TipperModel {
  TipperModel({
    this.emiratesId,
    this.password,
    this.userType,
    this.balance,
    this.userId,
    this.phoneNumber,
    this.email,
    this.username,
  });

  String? emiratesId;
  String? password;
  String? userType;
  int? balance;
  String? userId;
  String? phoneNumber;
  String? email;
  String? username;

  factory TipperModel.fromJson(Map<String, dynamic> json) => TipperModel(
        emiratesId: json["emirates_id"],
        password: json["password"],
        userType: json["user_type"],
        balance: json["balance"],
        userId: json["user_id"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "emirates_id": emiratesId,
        "password": password,
        "user_type": userType,
        "balance": balance,
        "user_id": userId,
        "phone_number": phoneNumber,
        "email": email,
        "username": username,
      };
}
