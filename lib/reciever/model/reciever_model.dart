// To parse this JSON data, do
//
//     final receiverModel = receiverModelFromJson(jsonString);

import 'dart:convert';

abstract class Copyable<T> {
  T copy();
  T copyWith();
}

ReceiverModel receiverModelFromJson(String str) =>
    ReceiverModel.fromJson(json.decode(str));

String receiverModelToJson(ReceiverModel data) => json.encode(data.toJson());

class ReceiverModel {
  ReceiverModel({
    this.userType,
    this.balance,
    this.userId,
    this.email,
    this.username,
    this.name,
    this.password,
    this.phoneNumber,
    this.imagePath,
  });

  String? userType;
  dynamic? balance;
  String? userId;
  String? email;
  String? username;
  String? name;
  String? password;
  String? phoneNumber;
  String? imagePath;

  factory ReceiverModel.fromJson(Map<String, dynamic> json) => ReceiverModel(
        userType: json["user_type"],
        balance: json["balance"],
        userId: json["user_id"],
        email: json["email"],
        username: json["username"],
        name: json["name"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "user_type": userType,
        "balance": balance,
        "user_id": userId,
        "email": email,
        "username": username,
        "name": name,
        "password": password,
        "phone_number": phoneNumber,
        "image_path": imagePath,
      };

  @override
  ReceiverModel copy() => ReceiverModel(
        userType: userType,
        balance: balance,
        userId: userId,
        email: email,
        username: username,
        name: name,
        password: password,
        imagePath: imagePath,
        phoneNumber: phoneNumber,
      );
  @override
  ReceiverModel copyWith({
    String? userType,
    dynamic? balance,
    String? userId,
    String? email,
    String? username,
    String? name,
    String? password,
    String? phoneNumber,
    String? imagePath,
  }) =>
      ReceiverModel(
        userType: userType ?? this.userType,
        balance: balance ?? this.balance,
        userId: userId ?? this.userId,
        email: email ?? this.email,
        username: username ?? this.username,
        name: name ?? this.name,
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        imagePath: imagePath ?? this.imagePath,
      );
}
