import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/view/login_page.dart';
import 'package:tipperapp/reciever/view/receiver_home_page.dart';

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
    User? _firebaseUser = FirebaseAuth.instance.currentUser;
    if (_firebaseUser != null) {
      var authenticationProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      var result = await authenticationProvider.getUserDataOnStartup();
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
        retVal = Scaffold(
          backgroundColor: appColor.blackColor,
          body: Center(
            child: CupertinoActivityIndicator(
              radius: 15,
            ),
          ),
        );
        break;
      case AuthStatus.showLoginPage:
        retVal = LoginPage();
        break;
      case AuthStatus.showReceiverHomePage:
        retVal = ReceiverHomePage();
        break;
      case AuthStatus.showTipperHomePage:
        retVal = Container();
        break;
      default:
    }
    return retVal;
  }
}
