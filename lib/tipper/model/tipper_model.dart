// To parse this JSON data, do
//
//     final tipperModel = tipperModelFromJson(jsonString);

import 'dart:convert';

abstract class Copyable<T> {
  T copy();
  T copyWith();
}

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

  @override
  TipperModel copy() => TipperModel(
        emiratesId: emiratesId,
        password: password,
        userType: userType,
        balance: balance,
        userId: userId,
        phoneNumber: phoneNumber,
        email: email,
        username: username,
      );

  @override
  TipperModel copyWith({
    String? emiratesId,
    String? password,
    String? userType,
    int? balance,
    String? userId,
    String? phoneNumber,
    String? email,
    String? username,
  }) =>
      TipperModel(
        emiratesId: emiratesId ?? this.emiratesId,
        password: password ?? this.password,
        userType: userType ?? this.userType,
        balance: balance ?? this.balance,
        userId: userId ?? this.userId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        username: username ?? this.username,
      );
}
