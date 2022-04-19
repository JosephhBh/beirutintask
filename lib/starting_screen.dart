import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => _navigationService.navigateAndRemove(
        name: kRootPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: appColor.blackColor,
      child: Container(
        height: Get.height,
        width: double.infinity,
        child: Center(
          child: GlobalText(
            color: appColor.yellowColor,
            text: "tipr",
            fontSize: 80,
          ),
        ),
      ),
    );
  }
}
