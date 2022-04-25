import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/view/login_page.dart';
import 'package:tipperapp/reciever/view/receiver_root_page.dart';

import 'package:tipperapp/tipper/view/tipper_root_page.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

enum AuthStatus {
  unknown,
  showLoginPage,
  showReceiverHomePage,
  showTipperHomePage
}

class RootPage extends StatefulWidget {
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.unknown;

  @override
  void initState() {
    checkUserStatus();
    super.initState();
  }

  checkUserStatus() async {
    // Future.delayed(Duration.zero, () {
    //   setState(() {
    //     _authStatus = AuthStatus.showHomePage;
    //   });
    // });
    // User? _firebaseUser = FirebaseAuth.instance.currentUser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');
    if (uid != null) {
      var authenticationProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      var result = await authenticationProvider.getUserDataOnStartup(uid);
      if (result == UserType.receiver.name) {
        _authStatus = AuthStatus.showReceiverHomePage;
      } else {
        _authStatus = AuthStatus.showTipperHomePage;
      }
    } else {
      _authStatus = AuthStatus.showLoginPage;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    Widget retVal = Container();
    switch (_authStatus) {
      case AuthStatus.unknown:
        retVal = GlobalScaffold(
          backgroundColor: appColor.yellowColor,
          child: Container(
            height: Get.height,
            width: double.infinity,
            child: Center(
              child: GlobalText(
                color: appColor.whiteColor,
                text: "tipr",
                fontSize: 80,
              ),
            ),
          ),
        );
        break;
      case AuthStatus.showLoginPage:
        retVal = LoginPage();
        break;
      case AuthStatus.showReceiverHomePage:
        retVal = ReceiverRootPage();
        break;
      case AuthStatus.showTipperHomePage:
        retVal = TipperRootPage();
        break;
      case AuthStatus.showTipperHomePage:
        retVal = Container();
        break;
      default:
    }
    return retVal;
  }
}
