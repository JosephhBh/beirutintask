import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tipperapp/core/controller/provider/error_message_provider/error_message_provider.dart';
import 'package:tipperapp/core/device_utils/app_colors.dart';

final double finalDeviceHeigh = Get.height;
final double finalDeviceWidth = Get.width;
final double adjustedDeviceHeight = 926;
final double givenDeviceHeight = 950;
final double givenDeviceWidth = 428;
late double finalHeight;
late double finalWidth;
late double finalFontSize;

setCurrentHeight(double heigh) {
  finalHeight = heigh * finalDeviceHeigh / givenDeviceHeight;
  return finalHeight;
}

setCurrentWidth(double width) {
  finalWidth = width * finalDeviceWidth / givenDeviceWidth;
  return finalWidth;
}

setFontSize(double fontSize) {
  finalFontSize = fontSize * (finalDeviceHeigh) / givenDeviceHeight;
  return finalFontSize;
}

AppColors appColor = AppColors();

heighSpacer(double height) => SizedBox(
      height: setCurrentHeight(height),
    );

widthSpacer(double width) => SizedBox(
      width: setCurrentWidth(width),
    );

applyPadding(
        double top, double left, double right, double bottom, Widget widget) =>
    Padding(
      padding: EdgeInsets.only(
        top: setCurrentHeight(top),
        left: setCurrentWidth(left),
        right: setCurrentWidth(right),
        bottom: setCurrentHeight(bottom),
      ),
      child: widget,
    );

late ErrorMessageProvider errorMessageProvider;
