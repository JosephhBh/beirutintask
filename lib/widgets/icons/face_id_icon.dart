import 'package:flutter/material.dart';

class FaceIdIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/app_icons/face_id.png'),
      fit: BoxFit.fill,
    );
  }
}
