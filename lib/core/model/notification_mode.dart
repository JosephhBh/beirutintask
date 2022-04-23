import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String id;
  String sentFrom;
  String sentTo;
  String title;
  String message;
  Timestamp date;
  bool isRead;
  bool replySent;
  NotificationModel({
    required this.id,
    required this.sentFrom,
    required this.sentTo,
    required this.title,
    required this.message,
    required this.date,
    required this.isRead,
    required this.replySent,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "sent_from": sentFrom,
        "sent_to": sentTo,
        "title": title,
        "message": message,
        "is_read": isRead,
        "reply_sent": replySent,
        "date": date
      };
}
