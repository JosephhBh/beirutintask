import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';

class ReceiverHomePage extends StatelessWidget {
  const ReceiverHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.greyColor,
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: appColor.transparentColor,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [],
      ),
    );
  }
}
