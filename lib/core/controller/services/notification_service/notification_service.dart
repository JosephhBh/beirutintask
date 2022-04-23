import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot> getReceiverNotifications(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .doc(uid)
        .snapshots();
  }

  updateGlobalIsReadNotificationStatus(String uid) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('notifications')
          .doc(uid)
          .update({"is_read": true});
    } catch (e) {
      debugPrint("update notifcation error $e");
    }
  }

  updateSingleNotificaitonStatus(String uid, String notificationId) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('notifications')
          .doc(uid)
          .collection('notifications')
          .doc(notificationId)
          .update({"is_read": true});
    } catch (e) {
      debugPrint('update single notification status error : $e');
    }
  }

  Stream<QuerySnapshot> getReadNotifications(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .doc(uid)
        .collection('notifications')
        .where('is_read', isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getUnreadNotifications(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .doc(uid)
        .collection('notifications')
        .where('is_read', isEqualTo: false)
        .snapshots();
  }

  String getNotificationsTime(Timestamp notifictaionDate) {
    String _finalNotifictaionDate = "";
    var currentDate = Timestamp.now().toDate();
    var date = notifictaionDate.toDate();
    final difference = currentDate.difference(date).inDays;
    if (difference > 0) {
      print('the difference in days is : $difference');
      if (difference == 1) {
        _finalNotifictaionDate = "$difference day ago";
      } else {
        _finalNotifictaionDate = "$difference days ago";
      }
    } else {
      final difference2 = currentDate.difference(date).inHours;
      if (difference2 > 0) {
        print('the difference in hours  : $difference2');
        if (difference2 == 1) {
          _finalNotifictaionDate = "$difference2 hour ago";
        } else {
          _finalNotifictaionDate = "$difference2 hours ago";
        }
      } else {
        final difference3 = currentDate.difference(date).inMinutes;
        if (difference3 < 60) {
          print('the difeerence in minuts is : $difference3');
          if (difference3 == 1) {
            _finalNotifictaionDate = "$difference3 minute ago";
          } else {
            _finalNotifictaionDate = "$difference3 minutes ago";
          }
        }
      }
    }
    return _finalNotifictaionDate;
  }

  sendThankYouMessageFromReceiverToTipper(
    String tipperId,
    String recieverId,
    String workerName,
    String receiverNotificationId,
  ) async {
    try {
      String notificationId = _firestore
          .collection('users')
          .doc(tipperId)
          .collection('notifications')
          .doc(tipperId)
          .collection('notifications')
          .doc()
          .id;
      await _firestore
          .collection('users')
          .doc(tipperId)
          .collection('notifications')
          .doc(tipperId)
          .collection('notifications')
          .doc(notificationId)
          .set({
        "title": "THANK YOU MESSAGE",
        "message": "Worker $workerName says thank you 😊",
        "date": Timestamp.now(),
        "is_read": false,
        "id": notificationId,
        "sent_from": tipperId,
        "sent_to": recieverId,
        "reply_sent": true,
      });
      debugPrint('receiver id : $recieverId - $tipperId - $notificationId');
      await _firestore
          .collection('users')
          .doc(tipperId)
          .collection('notifications')
          .doc(tipperId)
          .update({
        'is_read': false,
      });
      await _firestore
          .collection('users')
          .doc(recieverId)
          .collection('notifications')
          .doc(recieverId)
          .collection('notifications')
          .doc(receiverNotificationId)
          .update({
        'reply_sent': true,
      });
    } catch (e) {
      debugPrint('send thank you message error : $e');
    }
  }

  updateUnreadNotifcationsStatus(String tipperId) async {
    try {
      await Future.delayed(Duration(seconds: 7), () async {
        await _firestore
            .collection('users')
            .doc(tipperId)
            .collection('notifications')
            .doc(tipperId)
            .collection('notifications')
            .where('is_read', isEqualTo: false)
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) async {
            print(doc["message"]);
            await _firestore
                .collection('users')
                .doc(tipperId)
                .collection('notifications')
                .doc(tipperId)
                .collection('notifications')
                .doc(doc['id'])
                .update({"is_read": true});
          });
        });
      });
    } catch (e) {
      debugPrint("update unread notifcations error : $e");
    }
  }
}
