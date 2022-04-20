import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/containers/tipper_barcode_container.dart';
import 'package:tipperapp/widgets/icons/notification_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authenticationProvier =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Align(
            alignment: Alignment.center,
            child: ReceiverBarcodeContainer(
              username: authenticationProvier.receiverModel.username!,
              receiverUid: authenticationProvier.receiverModel.userId!,
            ),
          ),
        ],
      ),
    );
  }
}
