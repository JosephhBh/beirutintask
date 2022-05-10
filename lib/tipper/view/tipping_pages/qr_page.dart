import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tipperapp/core/controller/provider/tipping_provider/tipping_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  final NavigationService _navigationService = locator<NavigationService>();
  // Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    var tippingProvider = Provider.of<TippingProvider>(context, listen: false);
    if (Platform.isAndroid) {
      tippingProvider.controller!.pauseCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    var tippingProvider = Provider.of<TippingProvider>(context, listen: false);
    return GlobalScaffold(
      backgroundColor: appColor.yellowColor,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: QRView(
                key: tippingProvider.qrKey,
                onQRViewCreated: (QRViewController controller) {
                  tippingProvider.setController(controller);
                  controller.scannedDataStream.listen((scanData) async {
                    print('the scanned messge ${scanData.code!}');
                    await tippingProvider.checkIfWorkerExists(scanData.code!);
                  });
                },
                overlay: QrScannerOverlayShape(
                  borderColor: appColor.whiteColor,
                  borderRadius: 25,
                  borderLength: 50,
                  borderWidth: 20,
                  cutOutSize: setCurrentWidth(250),
                ),
                onPermissionSet: (ctrl, p) => {},
              ),
            ),
          ),
          applyPadding(
            15,
            0,
            0,
            0,
            Stack(
              fit: StackFit.loose,
              children: [
                GestureDetector(
                  onTap: () {
                    _navigationService.pop();
                  },
                  child: Container(
                    color: appColor.transparentColor,
                    // height: setCurrentHeight(70),
                    height: setCurrentHeight(56),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            widthSpacer(13),
                            BackIcon(),
                            widthSpacer(15),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FinalErrorWidget(),
        ],
      ),
    );
  }
}
