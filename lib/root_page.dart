import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/view/login_page.dart';

enum AuthStatus {
  unknown,
  showHomePage,
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
    Future.delayed(Duration.zero, () {
      setState(() {
        _authStatus = AuthStatus.showHomePage;
      });
    });
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
      case AuthStatus.showHomePage:
        retVal = LoginPage();
        break;
      default:
    }
    return retVal;
  }
}
