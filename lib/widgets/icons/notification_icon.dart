import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class NotificationIcon extends StatelessWidget {
  final Color color;
  final double size;
  NotificationIcon({
    required this.color,
    this.size = 35,
  });
  @override
  Widget build(BuildContext context) {
    // return Image(
    //   image: AssetImage('assets/app_icons/notification_icon.png'),
    //   fit: BoxFit.fill,
    // );
    return Icon(
      Icons.notifications,
      size: size,
      color: color,
    );
  }
}
