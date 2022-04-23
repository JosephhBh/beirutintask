import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/model/notification_mode.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/reciever/model/selected_receiver.dart';

List<int> tippingAmount = [
  5,
  10,
  20,
  30,
];

class TippingProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final NavigationService _navigationService = locator<NavigationService>();
  String _scannedQrMessage = "";
  bool _isScanned = false;
  Barcode? _result;
  QRViewController? _controller;
  GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  int _selectedAmount = tippingAmount.first;
  SelectedReceiver _selectedReceiver = SelectedReceiver();

  String get scannedQrMessage => _scannedQrMessage;
  bool get isScanned => _isScanned;
  Barcode? get result => _result;
  QRViewController? get controller => _controller;
  GlobalKey get qrKey => _qrKey;
  int get selectedAmount => _selectedAmount;
  SelectedReceiver get selectedReceiver => _selectedReceiver;

  void setScannedQrMessage(String val) {
    _scannedQrMessage = val;
    notifyListeners();
  }

  setController(QRViewController controller) {
    _controller = controller;
    notifyListeners();
  }

  void setSelectedAmount(int val) {
    _selectedAmount = val;
    notifyListeners();
  }

  checkIfWorkerExists(String scannedMessage) async {
    try {
      // String workerId = "6hBPOjs9JsWqPE2nJ30WraZV7hs2";
      errorMessageProvider.clearErrorMessage();
      List<String> _listOfWorkersIds = [];

      await FirebaseFirestore.instance
          .collection('users')
          .where('user_id', isEqualTo: scannedMessage)
          .limit(1)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          _listOfWorkersIds.add(doc.id);
          _selectedReceiver = SelectedReceiver(
              id: doc['user_id'],
              name: doc['name'],
              username: doc['username'],
              email: doc['email'],
              balance: doc['balance']);
        });
      });
      if (_listOfWorkersIds.length != 0) {
        _navigationService.replaceRoute(name: kTippingPage);
      } else {
        errorMessageProvider.setErrorMessage(message: "No user found");
      }
    } catch (e) {
      debugPrint('check if worker exists : $e');
    }
  }

  tipWorker(BuildContext context) async {
    try {
      /// check if user have balance
      /// get total amount
      /// update balance for current user
      /// update receiver with new balance
      /// send message to receiver
      /// send message to tipper
      var authenticationProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      String tipperId = authenticationProvider.tipperModel.userId!;
      String tipperName = authenticationProvider.tipperModel.username!;
      String receiverId = _selectedReceiver.id!;
      if (authenticationProvider.tipperModel.balance! >= _selectedAmount) {
        int tipperNewBalance =
            authenticationProvider.tipperModel.balance! - _selectedAmount;
        int receiverNewBalance = _selectedReceiver.balance! + selectedAmount;
        authenticationProvider
            .updateTipperModel(authenticationProvider.tipperModel.copyWith(
          balance: tipperNewBalance,
        ));
        await _firestore.collection('users').doc(tipperId).update({
          "balance": tipperNewBalance,
        });
        await _firestore.collection('users').doc(receiverId).update({
          "balance": receiverNewBalance,
        });
        String tipperNotificationId = await _firestore
            .collection('users')
            .doc(tipperId)
            .collection('notifications')
            .doc(tipperId)
            .collection('notifications')
            .doc()
            .id;
        String receiverNotificationId = await _firestore
            .collection('users')
            .doc(receiverId)
            .collection('notifications')
            .doc(receiverId)
            .collection('notifications')
            .doc()
            .id;
        NotificationModel tipperNotificaiton = NotificationModel(
          id: tipperNotificationId,
          sentFrom: tipperId,
          sentTo: receiverId,
          title: 'PAYMENT SUCCESSFUL',
          message: _selectedAmount.toString() +
              " AED transfered to ${_selectedReceiver.name}",
          date: Timestamp.now(),
          isRead: false,
          replySent: false,
        );
        NotificationModel receiverNotificaiton = NotificationModel(
          id: receiverNotificationId,
          sentFrom: tipperId,
          sentTo: receiverId,
          title: 'NEW TIP',
          message: tipperName +
              " just sent you $_selectedAmount AED,click down below to say thank you",
          date: Timestamp.now(),
          isRead: false,
          replySent: false,
        );
        await _firestore
            .collection('users')
            .doc(receiverId)
            .collection('notifications')
            .doc(receiverId)
            .update({
          "is_read": false,
        });

        await _firestore
            .collection('users')
            .doc(receiverId)
            .collection('notifications')
            .doc(receiverId)
            .collection('notifications')
            .doc(receiverNotificationId)
            .set(receiverNotificaiton.toJson());
        await _firestore
            .collection('users')
            .doc(tipperId)
            .collection('notifications')
            .doc(tipperId)
            .collection('notifications')
            .doc(tipperNotificationId)
            .set(tipperNotificaiton.toJson());
        // print(tipperNotificaiton.toJson());
        // _navigationService.pop();
        // _selectedReceiver = SelectedReceiver();
        _navigationService.replaceRoute(name: kPaymentSuccessPage);
      } else {
        errorMessageProvider.setErrorMessage(message: "Insufficient Funds");
      }
    } catch (e) {
      debugPrint("tip worker : $e");
      errorMessageProvider.setSomethingWentWrrongMessage();
    }
  }

  clearTippingProvider() {
    _scannedQrMessage = "";
    _isScanned = false;
    _selectedAmount = tippingAmount.first;
    _selectedReceiver = SelectedReceiver();
    notifyListeners();
  }
}
