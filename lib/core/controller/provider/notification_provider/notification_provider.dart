import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAvailableAdmis() {
    return _firestore
        .collection("users")
        .where('isAdmin', isEqualTo: true)
        .snapshots();
  }

  Stream<DocumentSnapshot> getNotifications(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .doc(uid)
        .snapshots();
  }
}
