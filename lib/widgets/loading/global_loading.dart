import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class GlobalLoading extends StatelessWidget {
  const GlobalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 12.5,
          sigmaY: 12.5,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              color: appColor.yellowColor,
            ),
          ),
        ),
      ),
    );
  }
}
