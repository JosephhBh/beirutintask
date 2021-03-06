import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionsService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getTransactions(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('transactions')
        .doc(uid)
        .collection('transactions')
        .snapshots();
  }
}
