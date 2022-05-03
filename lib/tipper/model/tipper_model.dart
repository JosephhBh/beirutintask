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
    // this.emiratesId,
    this.password,
    this.userType,
    this.balance,
    this.userId,
    this.phoneNumber,
    this.email,
    this.username,
    this.name,
    this.imagePath,
  });

  // String? emiratesId;
  String? password;
  String? userType;
  dynamic? balance;
  String? userId;
  String? phoneNumber;
  String? email;
  String? username;
  String? name;
  String? imagePath;

  factory TipperModel.fromJson(Map<String, dynamic> json) => TipperModel(
        // emiratesId: json["emirates_id"],
        password: json["password"],
        userType: json["user_type"],
        balance: json["balance"],
        userId: json["user_id"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        username: json["username"],
        name: json["name"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        // "emirates_id": emiratesId,
        "password": password,
        "user_type": userType,
        "balance": balance,
        "user_id": userId,
        "phone_number": phoneNumber,
        "email": email,
        "username": username,
        "name": name,
        "image_path": imagePath,
      };

  @override
  TipperModel copy() => TipperModel(
        // emiratesId: emiratesId,
        password: password,
        userType: userType,
        balance: balance,
        userId: userId,
        phoneNumber: phoneNumber,
        email: email,
        username: username,
        name: name,
        imagePath: imagePath,
      );

  @override
  TipperModel copyWith({
    String? password,
    String? userType,
    dynamic? balance,
    String? userId,
    String? phoneNumber,
    String? email,
    String? username,
    String? name,
    String? imagePath,
  }) =>
      TipperModel(
        password: password ?? this.password,
        userType: userType ?? this.userType,
        balance: balance ?? this.balance,
        userId: userId ?? this.userId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        username: username ?? this.username,
        name: name ?? this.name,
        imagePath: imagePath ?? this.imagePath,
      );
}
