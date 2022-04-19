import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class GlobalScaffold extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  GlobalScaffold({
    required this.backgroundColor,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: appColor.transparentColor,
        elevation: 0,
      ),
      body: child,
    );
  }
}
