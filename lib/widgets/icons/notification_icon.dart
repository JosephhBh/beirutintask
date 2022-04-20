import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/app_icons/notification_icon.png'),
      fit: BoxFit.fill,
    );
  }
}
