// To parse this JSON data, do
//
//     final receiverModel = receiverModelFromJson(jsonString);

import 'dart:convert';

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
  });

  String? userType;
  int? balance;
  String? userId;
  String? email;
  String? username;
  String? name;

  factory ReceiverModel.fromJson(Map<String, dynamic> json) => ReceiverModel(
        userType: json["user_type"],
        balance: json["balance"],
        userId: json["user_id"],
        email: json["email"],
        username: json["username"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "user_type": userType,
        "balance": balance,
        "user_id": userId,
        "email": email,
        "username": username,
        "name": name,
      };
}
