import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/services/notification_service/notification_service.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class ReceiverSupportPage extends StatelessWidget {
  final NotificationService _notificationService =
      locator<NotificationService>();
  @override
  Widget build(BuildContext context) {
    var authenticaionProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return GlobalScaffold(
      backgroundColor: appColor.yellowColor,
      child: Center(
        // child: StreamBuilder(
        //   stream: _notificationService.getReceiverNotifications(
        //       authenticaionProvider.receiverModel.userId!),
        //   builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //     if (!snapshot.hasData) {
        //       return Text("Loading");
        //     }
        //     var userDocument = snapshot.data;
        //     return Text(userDocument!["is_read"].toString());
        //   },
        // ),
        child: GlobalText(
          text: 'Support',
        ),
      ),
    );
  }
}
